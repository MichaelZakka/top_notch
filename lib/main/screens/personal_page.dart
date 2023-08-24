import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/auth/provider/auth_provider.dart';
import 'package:top_notch_v2/features/provider/order_provider.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 15, color: Colors.black54.withOpacity(0.55)),
      ),
    );
  }
}

class PersonalPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AuthProvider>(context, listen: false).userinfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xFFE8A874),
            ),
          );
        }
        var data = snapshot.data;
        return PersonalPageForm(
          name: data.name,
          email: data.email,
          address: 'Damascus, ${data.address}',
          number: '${data.phone_number}',
          context: context,
        );
      },
    );
  }
}

class PersonalPageForm extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String number;
  final BuildContext context; // Store the context received from the parent

  PersonalPageForm({
    required this.name,
    required this.email,
    required this.address,
    required this.number,
    required this.context, // Initialize the context parameter
  });
  @override
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Cotton Bear Print T-shirt',
      'image': 'assets/tshirt.jpg',
      'price': '9.99\$',
    },
    {
      'name': 'Sporty Outdoor Shoes',
      'image': 'assets/Shoes.jpg',
      'price': '25.90\$',
    },
  ];
  final List<Map<String, dynamic>> _soldProducts = [
    {
      'name': 'Fabric Plain Hooded Jacket',
      'image': 'assets/jacket.jpg',
      'price': '17.99\$',
    },
  ];
  @override
  void _showProductsPopup(List<Map<String, dynamic>> products, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              title,
              style: TextStyle(fontSize: 17),
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: FutureBuilder(
                future: Provider.of<OrderProvider>(context, listen: false)
                    .userproducts(),
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
                        child: Text('S.of(context).NoIt'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: getdata.length,
                      itemBuilder: (context, index) {
                        var product = getdata[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            leading:
                            Image.network('${Endpoints.baseUrl}/images/${product.image}'),
                            title: Text(product.name),
                            subtitle: Text('${product.price.toString()} SP'),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).Closed,
                style: TextStyle(color: Color(0xFFC0895E), fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showorderhistory(List<Map<String, dynamic>> products, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              title,
              style: TextStyle(fontSize: 17),
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: FutureBuilder(
                future: Provider.of<OrderProvider>(context, listen: false)
                    .orderhistory(),
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
                        child: Text('You haven\'t bought any products yet '),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: getdata.length,
                      itemBuilder: (context, index) {
                        var product = getdata[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            leading:
                            Image.network('${Endpoints.baseUrl}/images/${product.image}'),
                            title: Text(product.name),
                            subtitle: Text('${product.price.toString()} SP'),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(color: Color(0xFFC0895E), fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left,
            color: Color(0xFFC0895E),
            size: 34,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            S.of(context).Pers,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              InfoTile(label:  S.of(context).Fulln, value: name),
              InfoTile(label:  S.of(context).Email, value: email),
              InfoTile(label:  S.of(context).Address, value: address),
              InfoTile(label:  S.of(context).Phonen, value: number),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders history',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _showorderhistory(_products,  S.of(context).pur);
                      },
                      child: Text(
                        S.of(context).view,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFC0895E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).sold,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _showProductsPopup(_soldProducts, 'My products');
                      },
                      child: Text(
                        S.of(context).view,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFC0895E),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
