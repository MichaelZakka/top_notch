import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:top_notch_v2/auth/screens/login_screen.dart';
import 'package:top_notch_v2/features/provider/wishlist_provider.dart';
import 'package:top_notch_v2/main/screens/ContactUs.dart';
import 'package:top_notch_v2/main/screens/About.dart';
import 'package:top_notch_v2/main/widgets/model_sheet.dart';
import 'package:top_notch_v2/main/widgets/men_tab.dart';
import 'package:top_notch_v2/main/widgets/women_tab.dart';
import 'package:top_notch_v2/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/main/screens/personal_page.dart';
import 'package:top_notch_v2/features/screens/cart_screen.dart';
import 'package:top_notch_v2/main/screens/search_screen.dart';
import 'package:top_notch_v2/main/widgets/product_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon SearchIcon = Icon(Icons.search);
  Widget AppBarTitle = Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Text(
      'TOP NOTCH',
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'maghony',
          fontSize: 20.sp,
          letterSpacing: 1),
    ),
  );
  final SearchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController TabCtrl = TabController(length: 2, vsync: this);
    TabController product = TabController(length: 2, vsync: this);

    // void _navigateToNewScreen(String searchText) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => SearchScreen()),
    //   );
    // }

    return Scaffold(
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
              title: Text(S.of(context).Pers),
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
              title: Text(S.of(context).Lan),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail, color: Color(0xFFB27F55)),
              title: Text(S.of(context).Contact),
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
              title: Text(S.of(context).About),
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
              title: Text(S.of(context).Log),
              onTap: () async {
                final logout =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .logout();
                if (logout) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppBarTitle,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_rounded),
                color: Colors.black,
                iconSize: 25,
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: IconButton(
              icon: SearchIcon,
              color: Colors.black,
              iconSize: 25,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
                // setState(() {
                //   if (SearchIcon.icon == Icons.search) {
                //     SearchIcon = const Icon(
                //       Icons.close,
                //       size: 25,
                //       color: Colors.black,
                //     );

                //     this.AppBarTitle = Container(
                //       height: 50,
                //       width: 600,
                //       child: Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: new TextFormField(
                //           // onFieldSubmitted: _navigateToNewScreen,
                //           controller: SearchCtrl,
                //           decoration: InputDecoration(
                //               hintText: 'Search for products...',
                //               hintStyle: TextStyle(
                //                 fontSize: 16,
                //                 color: Colors.black.withOpacity(0.3),
                //               ),
                //               border: InputBorder.none),
                //           style: TextStyle(color: Colors.black, fontSize: 17),
                //         ),
                //       ),
                //     );
                //   } else {
                //     this.SearchIcon = new Icon(Icons.search);
                //     this.AppBarTitle = Padding(
                //       padding: const EdgeInsets.only(top: 5),
                //       child: new Text(
                //         'TOP NOTCH',
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontFamily: 'maghony',
                //             fontSize: 22,
                //             letterSpacing: 1),
                //       ),
                //     );
                //   }
                // });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 1, top: 8),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: IndexedStack(index: _selectedIndex, children: [
          Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Container(
                child: TabBar(
                  unselectedLabelColor: Color(0xFF353634).withOpacity(0.6),
                  indicatorColor: Color(0xFFE8A874),
                  labelColor: Color(0xFF353634),
                  labelStyle: TextStyle(fontSize: 16.5, color: Colors.black),
                  indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 1.4, color: Color(0xFFB78152)),
                      borderRadius: BorderRadius.circular(25),
                      insets: EdgeInsets.symmetric(horizontal: 20)),
                  controller: TabCtrl,
                  tabs: [
                    Tab(
                      text: S.of(context).men,
                      height: 40,
                    ),
                    Tab(
                      text: S.of(context).women,
                      height: 40,
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 800,
                child: TabBarView(
                  controller: TabCtrl,
                  children: const <Widget>[MenTab(), womenTab()],
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: Provider.of<WishlistProvider>(context, listen: false)
                  .getwishlist(),
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
                  if (getdata == null) {
                    return Center(
                      child: Text('No items found.'),
                    );
                  }
                  return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getdata.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55.sp,
                      ),
                      itemBuilder: (context, i) {
                        return Product_Widget(
                          product: getdata.products[i],
                        );
                      });
                }
              }),
        ]),
      ),
      floatingActionButton: SizedBox(
        height: 45,
        width: 45,
        child: Stack(
          children: [
            FloatingActionButton(
              elevation: 4,
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                    elevation: 12,
                    context: context,
                    builder: (context) {
                      return AddProduct();
                    });
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      colors: [Color(0xFFE8A874), Color((0xFF986842))]),
                ),
                child: Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 18,
              blurRadius: 25,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                _onTabChange(index);
              },
              backgroundColor: Colors.white,
              hoverColor: Colors.black,
              haptic: true,
              curve: Curves.easeIn,
              gap: 8,
              color: Colors.black,
              duration: Duration(milliseconds: 500),
              activeColor: Color(0xFF353634),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              tabMargin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              tabs: [
                GButton(
                  iconSize: 27,
                  hoverColor: Color(0xFFD59966),
                  iconColor: Colors.black.withOpacity(0.7),
                  iconActiveColor: Color(0xFFD59966),
                  textColor: Color(0xFFD59966),
                  icon: Icons.home_outlined,
                  text: S.of(context).All,
                  textSize: 18,
                ),
                GButton(
                  hoverColor: Color(0xFFD59966),
                  iconSize: 25,
                  iconColor: Colors.black.withOpacity(0.7),
                  iconActiveColor: Color(0xFFD59966),
                  textColor: Color(0xFFD59966),
                  icon: Icons.favorite_outline_outlined,
                  text: S.of(context).Wish,
                  textSize: 18,
                ),
              ]),
        ),
      ),
    );
  }
}
