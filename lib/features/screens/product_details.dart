import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/features/provider/cart_provider.dart';
import 'package:top_notch_v2/features/provider/wishlist_provider.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/features/widgets/rating_widget.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class ProductDetails extends StatefulWidget {
  // static const String routename = 'product_details';
  ProductModel product;

  ProductDetails({required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isfavorite = false;

  void action() {
    setState(() {
      isfavorite = !isfavorite;
    });
  }

  void _showRatingPopup() async {
    try {
      final double rating = await showDialog(
        context: context,
        builder: (context) => RatingPopup(
          product: widget.product,
        ),
      );
      if (rating != null) {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    width: double.infinity,
                    image: NetworkImage(
                        '${Endpoints.baseUrl}/images/${widget.product.image}'),
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_circle_left,
                        color: Color(0xFFC0895E),
                        size: 37,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 420,
                    child: Container(
                      width: 411,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: 350,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.product.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87.withOpacity(0.9)),
                        ),
                        Text('${widget.product.price} S.P',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                                color: Colors.black87))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xFFFAB400),
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${widget.product.reviews}',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              '(${widget.product.reviews_count})  ',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.55),
                                  fontSize: 15),
                            ),
                            Text(
                              S.of(context).Visitors,
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.55),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              _showRatingPopup(); // Show the rating pop-up
                            },
                            child: Text(S.of(context).Addr,
                                style: TextStyle(
                                  color: Color(0xFFC0895E),
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${widget.product.description}',
                      style: TextStyle(color: Colors.black87.withOpacity(0.6)),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(7),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFC0895E)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).Addtc,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.local_grocery_store_outlined),
                              ],
                            ),
                          ),
                          onPressed: () async {
                            final success = await Provider.of<CartProvider>(
                                    context,
                                    listen: false)
                                .addtocart(widget.product.id!);
                                if(success){
                                  ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product added successhully',),backgroundColor: Colors.green[700],),
                      );
                                }
                            print(success);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
