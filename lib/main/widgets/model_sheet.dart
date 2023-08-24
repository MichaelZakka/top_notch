import 'package:flutter/material.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/features/provider/cart_provider.dart';
import 'dart:io';

import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? selectedGender;
  String? selectedCategory;
  String? imagePath;
  File? image;
  final PnameCtrl = TextEditingController();
  final PpriceCtrl = TextEditingController();
  final PquantityCtrl = TextEditingController();
  final PdescCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imagePath = pickedImage.path;
      image = File(imagePath!);
      setState(() {});
    }
  }

  void _dismissBottomSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).Addy,
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD59966)),
              ),
              SizedBox(height: 5),
              Text(
                S.of(context).Please,
                style: TextStyle(
                    fontSize: 15.5, color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: PnameCtrl,
                cursorColor: Color(0xFFCE9869),
                decoration: InputDecoration(
                  labelText: S.of(context).ProductN,
                  labelStyle: TextStyle(
                    fontSize: 14.4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  focusColor: Color(0xFFCE9869),
                  fillColor: Color(0xFFCE9869),
                  hoverColor: Color(0xFFCE9869),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).ThisF;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(18),
                      decoration: InputDecoration(
                        labelText: S.of(context).Gender,
                        labelStyle: TextStyle(
                          fontSize: 14.4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        focusColor: Color(0xFFCE9869),
                        fillColor: Color(0xFFCE9869),
                        hoverColor: Color(0xFFCE9869),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Male',
                          child: Text(S.of(context).Male),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Female',
                          child: Text(S.of(context).Female),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).ThisF;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedCategory,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(18),
                      decoration: InputDecoration(
                        labelText: S.of(context).Category,
                        labelStyle: TextStyle(
                          fontSize: 14.4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        focusColor: Color(0xFFCE9869),
                        fillColor: Color(0xFFCE9869),
                        hoverColor: Color(0xFFCE9869),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Tops',
                          child: Text(S.of(context).Tops),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Jackets',
                          child: Text(S.of(context).Jackets),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Pants',
                          child: Text(S.of(context).Pants),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Shoes',
                          child: Text(S.of(context).Shoes),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).ThisF;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: PpriceCtrl,
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xFFCE9869),
                      decoration: InputDecoration(
                        labelText: S.of(context).Price,
                        labelStyle: TextStyle(
                          fontSize: 14.4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        focusColor: Color(0xFFCE9869),
                        fillColor: Color(0xFFCE9869),
                        hoverColor: Color(0xFFCE9869),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).ThisF;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: TextFormField(
                      controller: PquantityCtrl,
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xFFCE9869),
                      decoration: InputDecoration(
                        labelText: S.of(context).Quantity,
                        labelStyle: TextStyle(
                          fontSize: 14.4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        focusColor: Color(0xFFCE9869),
                        fillColor: Color(0xFFCE9869),
                        hoverColor: Color(0xFFCE9869),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).ThisF;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: PdescCtrl,
                cursorColor: Color(0xFFCE9869),
                decoration: InputDecoration(
                  labelText: S.of(context).Desc,
                  labelStyle: TextStyle(
                    fontSize: 14.4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  focusColor: Color(0xFFCE9869),
                  fillColor: Color(0xFFCE9869),
                  hoverColor: Color(0xFFCE9869),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).ThisF;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 230),
                child: TextButton(
                  child: Row(
                    children: [
                      Text(
                        S.of(context).Upload,
                        style: TextStyle(
                            fontSize: 14.4,
                            color: Color(0xFFC0895E),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.image_outlined,
                        color: Color(0xFFC0895E),
                      )
                    ],
                  ),
                  onPressed: _uploadImage,
                ),
              ),
              SizedBox(height: 10),
              if (imagePath != null) Image.file(File(imagePath!)),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC0895E)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  child: Text(
                    S.of(context).Add,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 70,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              title: Text(
                                S.of(context).Pending,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC0895E)),
                              ),
                              content: Text(S.of(context).YourPending),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _dismissBottomSheet();
                                  },
                                  child: Text(
                                    S.of(context).Ok,
                                    style: TextStyle(
                                        color: Color(0xFFC0895E), fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('S.of(context).PlzFill')),
                      );
                      print('else');
                    }

                    // final search =
                    //     await Provider.of<ProductProvider>(context, listen: false)
                    //         .search('ni');

                    // final review =
                    //     await Provider.of<ProductProvider>(context, listen: false)
                    //         .addreview(13, 4.2);
                    //  final my =await Provider.of<OrderProvider>(context,listen: false).makeanorder();
                    // final getcart =await Provider.of<CartProvider>(context,listen: false).getcart();
                    try {
                      final success = await Provider.of<ProductProvider>(
                              context,
                              listen: false)
                          .AddProduct(
                              PnameCtrl.text,
                              PdescCtrl.text,
                              double.parse(PpriceCtrl.text),
                              int.parse(PquantityCtrl.text),
                              imagePath!,
                              selectedCategory!,
                              selectedGender!);
                      print(success);
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
