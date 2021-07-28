import 'package:burgerjoint/Models/user.dart';
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
  static double appBarSize = 100.0;
}