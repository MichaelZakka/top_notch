import 'package:flutter/material.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class About extends StatelessWidget {
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
          padding: const EdgeInsets.only(left: 95),
          child: Text(
            S.of(context).About,
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset(
                'assets/Logotp.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              S.of(context).Top,
              style: TextStyle(
                color: Colors.black54.withOpacity(0.7),
                fontSize: 16.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
