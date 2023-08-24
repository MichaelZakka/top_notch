import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/main/screens/personal_page.dart';
import 'package:top_notch_v2/main/screens/About.dart';
import 'package:top_notch_v2/main/screens/ContactUs.dart';
import 'package:top_notch_v2/main/widgets/men_tab.dart';
import 'package:top_notch_v2/main/widgets/women_tab.dart';
import 'package:top_notch_v2/main/widgets/model_sheet.dart';
import 'package:top_notch_v2/features/screens/cart_screen.dart';
import 'package:top_notch_v2/main/widgets/product_widget.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchScreen(),
        theme: ThemeData(
          primaryColor: Color(0xFFE8A874),
          colorScheme: ColorScheme.fromSwatch(accentColor: Color((0xFF986842))),
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  Icon SearchIcon = Icon(Icons.search);
  Widget AppBarTitle = Padding(
    padding: const EdgeInsets.only(top: 5),
    child: new Text(
      'TOP NOTCH',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'maghony',
        fontSize: 22,
        letterSpacing: 1,
      ),
    ),
  );
  final SearchCtrl = TextEditingController();

  bool isSearchOpen = false;
  bool isFabOpen = false;
  late AnimationController _fabAnimationController;
  late Animation<double> _fabScaleAnimation;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _fabScaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _fabAnimationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  void toggleSearch() {
    setState(() {
      isSearchOpen = !isSearchOpen;
      if (isSearchOpen) {
        if (isFabOpen) {
          toggleFab();
        }
      }
    });
  }

  void toggleFab() {
    setState(() {
      isFabOpen = !isFabOpen;
      if (isFabOpen) {
        _fabAnimationController.forward();
      } else {
        _fabAnimationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController TabCtrl = TabController(length: 2, vsync: this);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 240,
                child: DrawerHeader(
                  child: Container(
                    height: 240,
                    child: Image.asset('assets/Logotp.png'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Color(0xFFB27F55)),
                title: Text('Personal Info'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.language, color: Color(0xFFB27F55)),
                title: Text('Language'),
                trailing: Switch(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ),
              ListTile(
                leading: Icon(Icons.mail, color: Color(0xFFB27F55)),
                title: Text('Contact us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Color(0xFFB27F55)),
                title: Text('About us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Color(0xFFB27F55)),
                title: Text('Log Out'),
                onTap: () {},
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
          title: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              // Use FadeTransition for the app bar title animation
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: isSearchOpen
                ? Container(
                    height: 50,
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new TextFormField(
                        controller: SearchCtrl,
                        decoration: InputDecoration(
                          hintText:  S.of(context).Searchfor,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(
                      'TOP NOTCH',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'maghony',
                        fontSize: 22,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: SearchIcon,
                  color: Colors.black,
                  iconSize: 25,
                  onPressed: toggleSearch,
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<ProductProvider>(context, listen: false)
                .search(SearchCtrl.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE8A874),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error occurred: ${snapshot.error}'),
                );
              } else {
                var getdata = snapshot.data;
                if (getdata == null || getdata.isEmpty) {
                  return Center(
                    child: Text('No items found.'),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your search results:',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 175.w / 315.h,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: List.generate(getdata.length, (index) {
                          return Product_Widget(
                            product: getdata[index],
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
