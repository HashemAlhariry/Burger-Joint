import 'package:burgerjoint/Models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Global {

  static late SharedPreferences prefs;
  static late User loggedInUser;
  static late String userToken;


  static String globalUrl = "" ;
  static String testUrl =   "";


  static var language = Global.prefs.getString('language_code') ?? 'en';



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


}