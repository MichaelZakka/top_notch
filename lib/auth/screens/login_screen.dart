import 'package:flutter/material.dart';
import 'package:top_notch_v2/auth/widgets/sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/auth/widgets/sign_up.dart';
import 'package:top_notch_v2/auth/screens/auth_screen.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController TabCtrl = TabController(length: 2, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/Fashion.jpg'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFD19869).withOpacity(0.4),
                Color(0xFF9C6944).withOpacity(0.4)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Positioned(
            top: 40.h,
            child: CustomPaint(
              painter: RPSCustomPainter(),
              size: Size(360.w, 683.h),
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 260.h,
              ),
              Container(
                child: TabBar(
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.w, color: Colors.white),
                      borderRadius: BorderRadius.circular(25.r),
                      insets: EdgeInsets.symmetric(horizontal: 85.0.h)),
                  labelStyle: TextStyle(fontSize: 18.sp),
                  controller: TabCtrl,
                  tabs: [
                    Tab(
                      text: S.of(context).Signi,
                      height: 52.h,
                    ),
                    Tab(
                      text: S.of(context).Signu,
                      height: 52.h,
                    )
                  ],
                ),
              ),
              Container(
                height: 369.h,
                child: TabBarView(controller: TabCtrl, children: [
                  SignIn(),
                  SignUp(),
                ]),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
