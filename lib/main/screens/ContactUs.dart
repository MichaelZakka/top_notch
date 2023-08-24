import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_notch_v2/generated/l10n.dart';



class ContactInfoTile extends StatelessWidget {
  final Icon icon;
  final String label;
  final String value;

  const ContactInfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(label),
      subtitle: Text(value),
    );
  }
}


class ContactUs extends StatelessWidget {

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
          padding: const EdgeInsets.only(left:92),
          child: Text(
            S.of(context).Contact,
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
          ),
        ),
      ),

      body: Center(
        child: Container(
          width: 390,
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),


              ContactInfoTile(
                icon: Icon(Icons.phone,color: Color(0xFFC0895E)),
                label: S.of(context).Phonen,
                value: '0900010100',
              ),
              ContactInfoTile(
                icon: Icon(Icons.email,color: Color(0xFFC0895E),),
                label: S.of(context).Email,
                value: 'TopNotch@gmail.com',
              ),
              ContactInfoTile(
                icon: Icon(FontAwesomeIcons.instagram,color: Color(0xFFC0895E),),
                label: S.of(context).Insta,
                value: '@TopNotch',
              ),
              ContactInfoTile(
                icon: Icon(FontAwesomeIcons.facebook,color:Color(0xFFC0895E),),
                label: S.of(context).Face,
                value: 'TopNotch',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

