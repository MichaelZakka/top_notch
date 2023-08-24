import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/main/screens/home_screen.dart';
import 'package:top_notch_v2/models/cart_model.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/features/provider/cart_provider.dart';
import 'package:top_notch_v2/features/provider/order_provider.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/generated/l10n.dart';
import 'package:top_notch_v2/end_points.dart';

class Product {
  final String name;
  final String imageUrl;
  String price;

  Product(
    this.name,
    this.imageUrl,
    this.price,
  );
}

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int quantity = 1;

  List<Product> cartItems = [
    Product('Cotton Bear Print T-shirt', 'assets/tshirt.jpg', '9.99 \$'),
    Product('Fabric Plain Hoodied Jacket', 'assets/jacket.jpg', '17.99 \$'),
    Product('Sporty Outdoor Skate Shoes', 'assets/Shoes.jpg', '25.90 \$'),
  ];

  void removeProduct(ProductModel product) {
    setState(() {
      cartItems.remove(product);
    });
  }

  void updateQuantity(int Quantity, int newQuantity) {
    setState(() {
      Quantity = newQuantity;
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  void showSaleRulesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Text(
            S.of(context).dissys,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC0895E)),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 212,
            width: 400,
            child: Column(
              children: [
                Text(
                  S.of(context).buy5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(S.of(context).buy11),
                SizedBox(
                  height: 10,
                ),
                Text(S.of(context).buy15),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).Ok,
                style: TextStyle(color: Color(0xFFC0895E), fontSize: 17),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int length = cartItems.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left,
            color: Color(0xFFC0895E),
            size: 33,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0, top: 5),
            child: IconButton(
              onPressed: showSaleRulesDialog,
              icon: Icon(
                Icons.discount_rounded,
                color: Color(0xFFC0895E),
                size: 27,
              ),
            ),
          ),
        ],
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text(
            S.of(context).MyC,
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future:
                  Provider.of<CartProvider>(context, listen: false).getcart(),
              builder: (context, snapshot) {
                var cartmodel = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Items',
                      style: TextStyle(fontSize: 16.5, color: Colors.black54));
                }
                if (cartmodel == null || cartmodel.products.isEmpty) {
                  Text('0 Items',
                      style: TextStyle(fontSize: 16.5, color: Colors.black54));
                }

                return Text('${cartmodel!.products.length} Items',
                    style: TextStyle(fontSize: 16.5, color: Colors.black54));
              }),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 270),
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xFFC0895E)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final empty =
                      await Provider.of<CartProvider>(context, listen: false)
                          .emptycart();
                  if (empty) {
                    clearCart();
                  }
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0.0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                child: Text(
                  S.of(context).Clearall,
                  style: TextStyle(
                    color: Color(0xFFC0895E),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: FutureBuilder(
            future: Provider.of<CartProvider>(context, listen: false).getcart(),
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
                var cart = snapshot.data;
                if (cart!.products.isEmpty) {
                  return Column(
                    children: [
                      Center(
                          child: Image.asset(
                        'assets/Empty.jpg',
                        scale: 5,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Row(
                          children: [
                            Text(
                              S.of(context).Yc,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          S.of(context).Looks,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          S.of(context).go,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home_Screen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFC0895E)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))),
                          child: Text(
                            S.of(context).Shop,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: cart.products.length,
                  itemBuilder: (ctx, index) {
                    final product = snapshot.data!.products;
                    return Column(
                      children: [
                        Container(
                          width: 395,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  '${Endpoints.baseUrl}/images/${snapshot.data!.products[index].image}',
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    snapshot.data!.products[index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    product[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.55),
                                                  width: 1.8)),
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (product[index].quantity > 1) {
                                            final decrease =
                                                await Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .decreasequanitiy(
                                                        product[index].id!);
                                            updateQuantity(
                                                quantity, quantity - 1);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${cart.cart!.values.toList()[index]}',
                                        style: TextStyle(fontSize: 18.5),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        icon: Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.55),
                                                  width: 1.8)),
                                          child: Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                        ),
                                        onPressed: () async {
                                          updateQuantity(
                                              quantity, quantity + 1);
                                          final add =
                                              await Provider.of<CartProvider>(
                                                      context,
                                                      listen: false)
                                                  .addtocart(
                                            product[index].id!,
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          removeProduct(product[index]);
                                          final delete =
                                              await Provider.of<CartProvider>(
                                                      context,
                                                      listen: false)
                                                  .deletefromcart(
                                                      product[index].id!);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_rounded,
                                          size: 24,
                                          color: Colors.redAccent,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    );
                  },
                );
              }
            },
          )),
          Container(
            height: 55,
            child: Column(
              children: [
                DottedLine(
                  dashLength: 8,
                  dashGapLength: 10,
                  dashColor: Colors.black54.withOpacity(0.4),
                  lineThickness: 1.2,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        S.of(context).Total,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    FutureBuilder(
                        future:
                            Provider.of<CartProvider>(context, listen: false)
                                .getcart(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Color(0xFFE8A874),
                                ));
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error occurred: ${snapshot.error}'),
                            );
                          } else {
                            var price = snapshot.data;
                            return Text(
                              '${price!.totalprice} S.P',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFC0895E),
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        }
                        // child: Text(
                        //   '555\S.P',
                        //   style: TextStyle(
                        //       fontSize: 27,
                        //       color: Color(0xFFC0895E),
                        //       fontWeight: FontWeight.bold),
                        // ),
                        ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () async {
                final makeorder =
                    await Provider.of<OrderProvider>(context, listen: false)
                        .makeanorder();
                setState(() {
                  clearCart();
                });
                if (makeorder) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Order created successfully',
                      ),
                      backgroundColor: Colors.green[700],
                    ),
                  );
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFC0895E)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              child: Text(
                S.of(context).Checkout,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
