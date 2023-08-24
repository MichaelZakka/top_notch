import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/generated/l10n.dart';


class RatingPopup extends StatefulWidget {
  ProductModel product;
  RatingPopup({required this.product});
  @override
  _RatingPopupState createState() => _RatingPopupState();
}

class _RatingPopupState extends State<RatingPopup> {
  double _rating = 0.0;

  String getRatingText(double rating) {
    if (rating > 0 && rating <= 1) {
      return S.of(context).wors;
    } else if (rating > 1 && rating <= 2) {
      return S.of(context).bad;
    } else if (rating > 2 && rating <= 3) {
      return S.of(context).ave;
    } else if (rating > 3 && rating <= 4) {
      return S.of(context).good;
    } else if (rating > 4 && rating <= 5) {
      return S.of(context).exc;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Add a review',
          style: TextStyle(fontSize: 16),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingBar.builder(
            initialRating: _rating,
            minRating: 0,
            maxRating: 5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          SizedBox(height: 10),
          Text(
            getRatingText(_rating),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(_rating);
            print(_rating);
            final addreview =
                await Provider.of<ProductProvider>(context, listen: false)
                    .addreview(widget.product.id!, _rating);
          },
          child: Text(
            'Submit',
            style: TextStyle(
                color: Color(0xFFC0895E), fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Color(0xFFC0895E), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
