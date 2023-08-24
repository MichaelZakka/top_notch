import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/auth/screens/initial_widget.dart';
import 'package:top_notch_v2/auth/screens/login_screen.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class Initial extends StatelessWidget {
  // const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/Fashion.jpg',
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFD19869).withOpacity(0.2),
                Color(0xFF9C6944).withOpacity(0.2)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Positioned(
            bottom: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFD19869), Color(0xFF9C6944)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              width: 411.w,
              height: 130.h,
            ),
          ),
          CustomPaint(
            painter: RPSCustomPainter(),
            size: Size(420.w, 683.4.h),
          ),
          Positioned(
            top: 400.h,
            left: 100.w,
            child: Center(
              child: Column(
                children: [
                  Text(S.of(context).LookG,
                      style: TextStyle(
                          letterSpacing: 1.5.w,
                          color: Color(0xFFBE895A),
                          fontSize: 30.sp,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold)),
                  Text(S.of(context).Feels,
                      style: TextStyle(
                          letterSpacing: 1.5.w,
                          color: Color(0xFFBE895A),
                          fontSize: 30.sp,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold)),
                ],
              ),

            ),
          ),
          Positioned(
            top: 500.h,
            left: 55.w,
            child: Center(
              child: Text(
                  S.of(context).Discover,
                  style: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 16.sp,
                    fontFamily: 'Lato',
                  )),
            ),
          ),
          Positioned(
              top: 630.h,
              left: 120.w,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>const LoginScreen()),
                  );
                },
                child: Center(
                  child: Text(S.of(context).GetS,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay',
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
