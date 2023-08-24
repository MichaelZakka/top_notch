import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/main/widgets/product_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/main/widgets/Sort_drop_menu.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/generated/l10n.dart';
class MenTab extends StatefulWidget {
  const MenTab({Key? key}) : super(key: key);

  @override
  State<MenTab> createState() => _MenTabState();
}

class _MenTabState extends State<MenTab> with TickerProviderStateMixin {
  late TabController tabController;
  var data;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    String sorttype = "";
    return Column(
      children: [
        SizedBox(
          height: 7,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              unselectedLabelColor: Color(0xFF353634).withOpacity(0.6),
              indicatorColor: Color(0xFFE8A874),
              labelColor: Color(0xFFFFFFFF),
              labelStyle: TextStyle(fontSize: 15.5),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8A874), Color((0xFF986842))],
                ),
              ),
              tabs: [
                Tab(text: S.of(context).Tops, height: 40),
                Tab(text: S.of(context).Jackets, height: 40),
                Tab(text: S.of(context).Pants, height: 40),
                Tab(text: S.of(context).Shoes, height: 40),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  // SortDropMenu(),
                  SizedBox(
                    height: 5,
                  ),
                  FutureBuilder(
                      future:
                          Provider.of<ProductProvider>(context, listen: false)
                              .getProducts("tops", "male", ''),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: getdata.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55.sp,
                              ),
                              itemBuilder: (context, i) {
                                return Product_Widget(
                                  product: getdata[i],
                                );
                              });
                        }
                      }),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  // SortDropMenu(),
                  SizedBox(
                    height: 7,
                  ),
                  FutureBuilder(
                      future:
                          Provider.of<ProductProvider>(context, listen: false)
                              .getProducts("jackets", "male", "high-to-low"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: getdata.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55.sp,
                              ),
                              itemBuilder: (context, i) {
                                return Product_Widget(
                                  product: getdata[i],
                                );
                              });
                        }
                      }),
                ],
              ),
              Column(children: [
                SizedBox(
                  height: 7,
                ),
                // SortDropMenu(),
                SizedBox(
                  height: 7,
                ),
                FutureBuilder(
                    future: Provider.of<ProductProvider>(context, listen: false)
                        .getProducts("pants", "male", "high-to-low"),
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
                          print(sorttype);

                          return Center(
                            child: Text('No items found.'),
                          );
                        }
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: getdata.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.55.sp,
                            ),
                            itemBuilder: (context, i) {
                              return Product_Widget(
                                product: getdata[i],
                              );
                            });
                      } 
                    }),
              ]),
              Column(children: [
                SizedBox(
                  height: 7,
                ),
                // SortDropMenu(),
                SizedBox(
                  height: 7,
                ),
                FutureBuilder(
                    future: Provider.of<ProductProvider>(context, listen: false)
                        .getProducts("shoes", "male", "high-to-low"),
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
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: getdata.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.55.sp,
                            ),
                            itemBuilder: (context, i) {
                              return Product_Widget(
                                product: getdata[i],
                              );
                            });
                      }
                    }),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
