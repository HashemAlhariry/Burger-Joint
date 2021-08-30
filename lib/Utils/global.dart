import 'package:burgerjoint/Models/branch.dart';
import 'package:burgerjoint/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Global {

  static late SharedPreferences prefs;
  static late User loggedInUser;
  static late String userToken;


  static String globalUrl = "" ;
  // testing local url
  static String testUrl =  "https://bj.marshelles.com/public/" ;


  static String mainColor ="ED1C24";

  static var language = Global.prefs.getString('language_code') ?? 'en';

  static late Branch branch;

  /*** Cart FOR USER'S PRODUCT ***/
  //static List<CartItem> cartItems=[];

  /// * APP BAR HEIGHT ***/
  static double appBarSize = 120.0;


  /// * PAGE ROUTE FOR ANIMATING SCREEN GLOBALLY ***/
  static PageRouteBuilder pageRouteBuilder (screen) {
    return PageRouteBuilder (
        transitionDuration: Duration(milliseconds: 250 ),
        transitionsBuilder: (context, animation, animationTime, child) {

          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );

        },
        pageBuilder: (context, animation, animationTime) {
          return screen;
        });
  }

  /// FUNCTION TAKES STRING HEXCOLOR AND CHANGE IT TO COLOR ***/
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  //global toast_message send message in an argument
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }


  //GLOBAL USER LOGGED IN
  late User user;
}