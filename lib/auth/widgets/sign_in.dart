import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/auth/provider/auth_provider.dart';
import 'package:top_notch_v2/auth/widgets/auth_textfield.dart';
import 'package:top_notch_v2/main/screens/home_screen.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AuthTextfield(
          hinttext: S.of(context).Email,
          ic: Icons.person,
          obsecurity: false,
          tt: TextInputType.emailAddress,
          controller: email,
        ),
        AuthTextfield(
          hinttext: S.of(context).Password,
          ic: Icons.lock,
          obsecurity: true,
          tt: TextInputType.name,
          controller: password,
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            final success =
                await Provider.of<AuthProvider>(context, listen: false)
                    .login(email.text, password.text);
            print(success);
            if (success) {
              setState(() {
                isLoading = false;
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>const Home_Screen()));
            } else {
              setState(() {
                isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Invalid email or password',
                  )));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 8,
            fixedSize: Size(275.w, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
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
            S.of(context).Signi,
                  style: TextStyle(color: Color(0xFFCE9869), fontSize: 18.sp),
                ),
        )
      ],
    );
  }
}
