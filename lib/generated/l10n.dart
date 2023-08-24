// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Tops`
  String get Tops {
    return Intl.message(
      'Tops',
      name: 'Tops',
      desc: '',
      args: [],
    );
  }

  /// `Jackets`
  String get Jackets {
    return Intl.message(
      'Jackets',
      name: 'Jackets',
      desc: '',
      args: [],
    );
  }

  /// `Pants`
  String get Pants {
    return Intl.message(
      'Pants',
      name: 'Pants',
      desc: '',
      args: [],
    );
  }

  /// `Shoes`
  String get Shoes {
    return Intl.message(
      'Shoes',
      name: 'Shoes',
      desc: '',
      args: [],
    );
  }

  /// `Sort by price`
  String get Sort {
    return Intl.message(
      'Sort by price',
      name: 'Sort',
      desc: '',
      args: [],
    );
  }

  /// `Highest to lowest`
  String get Highest {
    return Intl.message(
      'Highest to lowest',
      name: 'Highest',
      desc: '',
      args: [],
    );
  }

  /// `Lowest to highest`
  String get Lowest {
    return Intl.message(
      'Lowest to highest',
      name: 'Lowest',
      desc: '',
      args: [],
    );
  }

  /// `All products`
  String get All {
    return Intl.message(
      'All products',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get Wish {
    return Intl.message(
      'Wishlist',
      name: 'Wish',
      desc: '',
      args: [],
    );
  }

  /// `Search for products...`
  String get Searchfor {
    return Intl.message(
      'Search for products...',
      name: 'Searchfor',
      desc: '',
      args: [],
    );
  }

  /// `Add your own products`
  String get Addy {
    return Intl.message(
      'Add your own products',
      name: 'Addy',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all the required information for your product:`
  String get Please {
    return Intl.message(
      'Please enter all the required information for your product:',
      name: 'Please',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get ProductN {
    return Intl.message(
      'Product Name',
      name: 'ProductN',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Price(s.p)`
  String get Price {
    return Intl.message(
      'Price(s.p)',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Desc {
    return Intl.message(
      'Description',
      name: 'Desc',
      desc: '',
      args: [],
    );
  }

  /// `Upload image`
  String get Upload {
    return Intl.message(
      'Upload image',
      name: 'Upload',
      desc: '',
      args: [],
    );
  }

  /// `Add product`
  String get Add {
    return Intl.message(
      'Add product',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get ThisF {
    return Intl.message(
      'This field is required',
      name: 'ThisF',
      desc: '',
      args: [],
    );
  }

  /// `Your product is pending!`
  String get Pending {
    return Intl.message(
      'Your product is pending!',
      name: 'Pending',
      desc: '',
      args: [],
    );
  }

  /// `Your product is pending until the confirmation of the admin.`
  String get YourPending {
    return Intl.message(
      'Your product is pending until the confirmation of the admin.',
      name: 'YourPending',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Visitors`
  String get Visitors {
    return Intl.message(
      'Visitors',
      name: 'Visitors',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get Addtc {
    return Intl.message(
      'Add to cart',
      name: 'Addtc',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get MyC {
    return Intl.message(
      'My Cart',
      name: 'MyC',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get Clearall {
    return Intl.message(
      'Clear all',
      name: 'Clearall',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get Item {
    return Intl.message(
      'Item',
      name: 'Item',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get Items {
    return Intl.message(
      'Items',
      name: 'Items',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get Total {
    return Intl.message(
      'Total amount',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Discount system`
  String get dissys {
    return Intl.message(
      'Discount system',
      name: 'dissys',
      desc: '',
      args: [],
    );
  }

  /// `Buy 5 to 10 products, and get 15% off on your purchase`
  String get buy5 {
    return Intl.message(
      'Buy 5 to 10 products, and get 15% off on your purchase',
      name: 'buy5',
      desc: '',
      args: [],
    );
  }

  /// `Buy 11 to 15 products, and get 30% off on your purchase`
  String get buy11 {
    return Intl.message(
      'Buy 11 to 15 products, and get 30% off on your purchase',
      name: 'buy11',
      desc: '',
      args: [],
    );
  }

  /// `Buy more than 15 products, and get 50% off on your purchase`
  String get buy15 {
    return Intl.message(
      'Buy more than 15 products, and get 50% off on your purchase',
      name: 'buy15',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your cart`
  String get Yc {
    return Intl.message(
      'Your cart',
      name: 'Yc',
      desc: '',
      args: [],
    );
  }

  /// `is empty!`
  String get ise {
    return Intl.message(
      'is empty!',
      name: 'ise',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you have not added anything to your cart.`
  String get Looks {
    return Intl.message(
      'Looks like you have not added anything to your cart.',
      name: 'Looks',
      desc: '',
      args: [],
    );
  }

  /// `go ahead and explore top categories`
  String get go {
    return Intl.message(
      'go ahead and explore top categories',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get Shop {
    return Intl.message(
      'Shop Now',
      name: 'Shop',
      desc: '',
      args: [],
    );
  }

  /// `Add review!`
  String get Addr {
    return Intl.message(
      'Add review!',
      name: 'Addr',
      desc: '',
      args: [],
    );
  }

  /// `Rate the product please`
  String get Rate {
    return Intl.message(
      'Rate the product please',
      name: 'Rate',
      desc: '',
      args: [],
    );
  }

  /// `Worst`
  String get wors {
    return Intl.message(
      'Worst',
      name: 'wors',
      desc: '',
      args: [],
    );
  }

  /// `Bad`
  String get bad {
    return Intl.message(
      'Bad',
      name: 'bad',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get ave {
    return Intl.message(
      'Average',
      name: 'ave',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Excellent`
  String get exc {
    return Intl.message(
      'Excellent',
      name: 'exc',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get canc {
    return Intl.message(
      'Cancel',
      name: 'canc',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get sub {
    return Intl.message(
      'Submit',
      name: 'sub',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get Pers {
    return Intl.message(
      'Personal Info',
      name: 'Pers',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Lan {
    return Intl.message(
      'Languages',
      name: 'Lan',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get Cont {
    return Intl.message(
      'Contact us',
      name: 'Cont',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get About {
    return Intl.message(
      'About us',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Log {
    return Intl.message(
      'Log out',
      name: 'Log',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get Fulln {
    return Intl.message(
      'Full Name',
      name: 'Fulln',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phonen {
    return Intl.message(
      'Phone Number',
      name: 'Phonen',
      desc: '',
      args: [],
    );
  }

  /// `Purshaced products`
  String get pur {
    return Intl.message(
      'Purshaced products',
      name: 'pur',
      desc: '',
      args: [],
    );
  }

  /// `My products`
  String get sold {
    return Intl.message(
      'My products',
      name: 'sold',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get Contact {
    return Intl.message(
      'Contact us',
      name: 'Contact',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get Insta {
    return Intl.message(
      'Instagram',
      name: 'Insta',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get Face {
    return Intl.message(
      'Facebook',
      name: 'Face',
      desc: '',
      args: [],
    );
  }

  /// `TopNotch is a leading app that brings you the finest selection of fashion products from around the world. We strive to provide our customers with a seamless and enjoyable shopping experience. With a wide range of clothes, we aim to be your one-stop destination for all your appearence needs.`
  String get Top {
    return Intl.message(
      'TopNotch is a leading app that brings you the finest selection of fashion products from around the world. We strive to provide our customers with a seamless and enjoyable shopping experience. With a wide range of clothes, we aim to be your one-stop destination for all your appearence needs.',
      name: 'Top',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Closed {
    return Intl.message(
      'Close',
      name: 'Closed',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the required fields!`
  String get PlzFill {
    return Intl.message(
      'Please fill all the required fields!',
      name: 'PlzFill',
      desc: '',
      args: [],
    );
  }

  /// `No Items Found!`
  String get NoIt {
    return Intl.message(
      'No Items Found!',
      name: 'NoIt',
      desc: '',
      args: [],
    );
  }

  /// `S.P`
  String get Sp {
    return Intl.message(
      'S.P',
      name: 'Sp',
      desc: '',
      args: [],
    );
  }

  /// `Your search results:`
  String get YourRes {
    return Intl.message(
      'Your search results:',
      name: 'YourRes',
      desc: '',
      args: [],
    );
  }

  /// `Look Good`
  String get LookG {
    return Intl.message(
      'Look Good',
      name: 'LookG',
      desc: '',
      args: [],
    );
  }

  /// `Feel Good`
  String get Feels {
    return Intl.message(
      'Feel Good',
      name: 'Feels',
      desc: '',
      args: [],
    );
  }

  /// `Discover the latest trends in fashion`
  String get Discover {
    return Intl.message(
      'Discover the latest trends in fashion',
      name: 'Discover',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetS {
    return Intl.message(
      'Get Started',
      name: 'GetS',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Signi {
    return Intl.message(
      'Sign in',
      name: 'Signi',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signu {
    return Intl.message(
      'Sign up',
      name: 'Signu',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Conf {
    return Intl.message(
      'Confirm Password',
      name: 'Conf',
      desc: '',
      args: [],
    );
  }

  /// `Enter your region`
  String get Enter {
    return Intl.message(
      'Enter your region',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `Abu rummaneh`
  String get Abu {
    return Intl.message(
      'Abu rummaneh',
      name: 'Abu',
      desc: '',
      args: [],
    );
  }

  /// `Bab touma`
  String get Bab {
    return Intl.message(
      'Bab touma',
      name: 'Bab',
      desc: '',
      args: [],
    );
  }

  /// `Jaramana`
  String get Jar {
    return Intl.message(
      'Jaramana',
      name: 'Jar',
      desc: '',
      args: [],
    );
  }

  /// `Kafar Souseh`
  String get Kaf {
    return Intl.message(
      'Kafar Souseh',
      name: 'Kaf',
      desc: '',
      args: [],
    );
  }

  /// `Malki`
  String get Malki {
    return Intl.message(
      'Malki',
      name: 'Malki',
      desc: '',
      args: [],
    );
  }

  /// `Mazzeh`
  String get Mezz {
    return Intl.message(
      'Mazzeh',
      name: 'Mezz',
      desc: '',
      args: [],
    );
  }

  /// `Midan`
  String get Mid {
    return Intl.message(
      'Midan',
      name: 'Mid',
      desc: '',
      args: [],
    );
  }

  /// `Muhajereen`
  String get Muhajreen {
    return Intl.message(
      'Muhajereen',
      name: 'Muhajreen',
      desc: '',
      args: [],
    );
  }

  /// `Rawdah`
  String get Rawdah {
    return Intl.message(
      'Rawdah',
      name: 'Rawdah',
      desc: '',
      args: [],
    );
  }

  /// `Ruken Aldeen`
  String get Ruken {
    return Intl.message(
      'Ruken Aldeen',
      name: 'Ruken',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
