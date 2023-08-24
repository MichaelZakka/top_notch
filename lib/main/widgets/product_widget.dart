import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/features/screens/product_details.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/features/provider/wishlist_provider.dart';

class Product_Widget extends StatefulWidget {
  ProductModel product;
  Product_Widget({required this.product});
  @override
  State<Product_Widget> createState() => _Product_WidgetState();
}

class _Product_WidgetState extends State<Product_Widget> {
  @override
  bool? isfavorite;
  @override
  void initState() {
    super.initState();
    isfavorite = widget.product.isinwishlist;
    print(isfavorite);
  }

  void action() {
    setState(() {
      widget.product.isinwishlist = !widget.product.isinwishlist;
      isfavorite = !isfavorite!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFFD59966),
      hoverColor: Color(0xFFD59966),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: widget.product),
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    width: 166.w,
                    height: 200.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(33),
                      child: Image.network(
                        '${Endpoints.baseUrl}/images/${widget.product.image}',
                      ),
                    )),
                Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.7)),
                      child: Text(
                        'h',
                        style: TextStyle(color: Colors.white, fontSize: 1),
                      )),
                ),
                Positioned(
                  right: 8,
                  top: 5,
                  child: IconButton(
                    icon: isfavorite!
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 21,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            size: 21,
                          ),
                    onPressed: () async {
                      if (isfavorite!) {
                        final remove = await Provider.of<WishlistProvider>(
                                context,
                                listen: false)
                            .removefromwishlist(widget.product.id);
                        if (remove) {
                          action();
                        }
                      } else if (!isfavorite!) {
                        final add = await Provider.of<WishlistProvider>(context,
                                listen: false)
                            .addtowishlist(widget.product.id);

                        if (add) {
                          action();
                        }
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              color: Colors.transparent,
              width: 145.w,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5,
                            color: Colors.black87.withOpacity(0.9)),
                      ),
                      Text('${widget.product.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.5,
                              color: Colors.black54)),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFFFAB400),
                            size: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${widget.product.reviews}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
