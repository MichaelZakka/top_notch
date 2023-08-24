import 'package:flutter/material.dart';
import 'package:top_notch_v2/main/widgets/product_widget.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/main/widgets/Sort_drop_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';

class womenTab extends StatefulWidget {
  const womenTab({super.key});

  @override
  State<womenTab> createState() => _womenTabState();
}

class _womenTabState extends State<womenTab> with TickerProviderStateMixin {
  var data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController TabCtrl2 = TabController(length: 4, vsync: this);
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: TabCtrl2,
              unselectedLabelColor: Color(0xFF353634).withOpacity(0.4),
              indicatorColor: Color(0xFFE8A874),
              labelColor: Color(0xFFFFFFFF),
              labelStyle: TextStyle(fontSize: 15.5),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                    colors: [Color(0xFFF6B786), Color((0xFF986842))]),
              ),
              tabs: [
                Tab(text: 'Tops', height: 40),
                Tab(text: 'Jackets', height: 40),
                Tab(text: 'Pants', height: 40),
                Tab(text: 'Shoes', height: 40),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 700,
          child: TabBarView(
            controller: TabCtrl2,
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
                              .getProducts("tops", "female", "high-to-low"),
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
                  // GridView.count(
                  //   crossAxisCount: 2,
                  //   childAspectRatio: 175.w / 315.h,
                  //   shrinkWrap: true,
                  //   physics: ScrollPhysics(),
                  //   children: List.generate(4, (index) {
                  //     return Center(child: Product_Widget());
                  //   }),
                  // ),
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
                              .getProducts("jackets", "female", "high-to-low"),
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
                        .getProducts("pants", "female", "high-to-low"),
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
                        .getProducts("shoes", "female", "high-to-low"),
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
