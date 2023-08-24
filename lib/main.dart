import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:top_notch_v2/features/provider/cart_provider.dart';
import 'package:top_notch_v2/features/provider/order_provider.dart';
import 'package:top_notch_v2/features/provider/wishlist_provider.dart';
import 'package:top_notch_v2/get_started.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_notch_v2/auth/provider/auth_provider.dart';
import 'package:top_notch_v2/LocalRepo.dart';
import 'package:top_notch_v2/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';



void main() {
  setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalRepo localRepo = GetIt.instance<LocalRepo>();

    return ScreenUtilInit(
        builder: (context, child) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (ctx) => AuthProvider()),
                ChangeNotifierProvider(create: (ctx) => ProductProvider()),
                ChangeNotifierProvider(create: (ctx) => WishlistProvider()),
                ChangeNotifierProvider(create: (ctx) => CartProvider()),
                ChangeNotifierProvider(create: (ctx) => OrderProvider()),
              ],
              
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                ),
                  localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            // locale: Locale('ar'),
                home: Initial(),
              ),
            ));
  }
}
