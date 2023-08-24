import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/auth/widgets/auth_textfield.dart';
import 'package:top_notch_v2/auth/provider/auth_provider.dart';
import 'package:top_notch_v2/main/screens/home_screen.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _signuptabState();
}

class _signuptabState extends State<SignUp> {
  final EmailupCtrl = TextEditingController();
  final PassupCtrl = TextEditingController();
  final PassConfirmCtrl = TextEditingController();
  final NameCtrl = TextEditingController();
  final PhoneCtrl = TextEditingController();
  final AddressCtrl = TextEditingController();
  String? address;
  bool isLoading = false;
  final Regions = [
    'Abu Rummaneh',
    'Bab Touma',
    'Jaramana',
    'Kafar Souseh',
    'Malki',
    'Mezzeh',
    'Midan',
    'Muhajreen',
    'Rawdah',
    'Ruken Aldin'
  ];

  Future Signupfun() async {
    setState(() {
      isLoading = true;
    });
    final success = await Provider.of<AuthProvider>(context, listen: false)
        .register(NameCtrl.text, EmailupCtrl.text, PassupCtrl.text,
            address.toString(), PhoneCtrl.text, PassConfirmCtrl.text);
    if (success) {
      await Provider.of<AuthProvider>(context, listen: false)
          .login(EmailupCtrl.text, PassupCtrl.text);
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    } else {
      setState(() {
        isLoading = false;
      });
      print('failed');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 750.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AuthTextfield(
                hinttext: S.of(context).Fulln,
                ic: Icons.person,
                obsecurity: false,
                tt: TextInputType.emailAddress,
                controller: NameCtrl),
            AuthTextfield(
              hinttext: S.of(context).Email,
              ic: Icons.mail,
              obsecurity: false,
              tt: TextInputType.emailAddress,
              controller: EmailupCtrl,
            ),
            AuthTextfield(
              hinttext: S.of(context).Password,
              ic: Icons.lock,
              obsecurity: true,
              tt: TextInputType.name,
              controller: PassupCtrl,
            ),
            AuthTextfield(
              hinttext: S.of(context).Conf,
              ic: Icons.lock,
              obsecurity: true,
              tt: TextInputType.name,
              controller: PassConfirmCtrl,
            ),
            AuthTextfield(
              hinttext: S.of(context).Phonen,
              ic: Icons.phone,
              obsecurity: false,
              tt: TextInputType.number,
              controller: PhoneCtrl,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.h),
                child: Container(
                    height: 65.h,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 8,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.h),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFFCE9869),
                                size: 23,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isDense: true,
                                    borderRadius: BorderRadius.circular(12),
                                    hint: Text(
                                      S.of(context).Enter,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.3)),
                                    ),
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 67.w),
                                      child: Padding(
                                        padding:
                                             EdgeInsets.only(left: 15.w),
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black.withOpacity(0.4),
                                          size: 29,
                                        ),
                                      ),
                                    ),
                                    value: address,
                                    items: [
                                      DropdownMenuItem(
                                        value: Regions[0],
                                        child: Text(S.of(context).Abu),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[1],
                                        child: Text(S.of(context).Bab),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[2],
                                        child: Text(S.of(context).Jar),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[3],
                                        child: Text(S.of(context).Kaf),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[4],
                                        child: Text(S.of(context).Malki),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[5],
                                        child: Text(S.of(context).Mezz),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[6],
                                        child: Text(S.of(context).Mid),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[7],
                                        child: Text(S.of(context).Muhajreen),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[8],
                                        child: Text(S.of(context).Rawdah),
                                      ),
                                      DropdownMenuItem(
                                        value: Regions[9],
                                        child: Text(S.of(context).Ruken),
                                      ),
                                    ],
                                    onChanged: (value) => setState(() {
                                      this.address = value;
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )))),
            ElevatedButton(
              onPressed: () {
                Signupfun();
                if (NameCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Name cannot be empty',
                      )));
                } else if (!NameCtrl.text.isEmpty && NameCtrl.text.length < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'The name field must be at least 2 characters.',
                      )));
                } else if (EmailupCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Email cannot be empty',
                      )));
                } else if (!EmailupCtrl.text.contains('@') ||
                    !EmailupCtrl.text.contains('.com')) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'The email field must be a valid email address.',
                      )));
                } else if (PassupCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Password cannot be empty',
                      )));
                } else if (!PassupCtrl.text.isEmpty &&
                    PassupCtrl.text.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Password must be at least 8 characters ',
                      )));
                } else if (PassConfirmCtrl.text != PassupCtrl.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'There is no match with password',
                      )));
                } else if (PhoneCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Phone number cannot be empty',
                      )));
                }
              },
              child: isLoading
                  ? Container(
                      width: 15.w,
                      height: 15.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Color(0xFFCE9869),
                      ),
                    )
                  : Text(
                      S.of(context).Signu,
                      style: TextStyle(color: Color(0xFFCE9869), fontSize: 22),
                    ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.black,
                elevation: 8,
                fixedSize: Size(275.w, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
