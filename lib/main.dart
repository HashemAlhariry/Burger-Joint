import 'package:burgerjoint/Providers/cart_provider.dart';
import 'package:burgerjoint/Providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/user.dart';
import 'Screens/HomePage/home_page.dart';
import 'Utils/app_localizations.dart';
import 'Utils/global.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Global.prefs = await SharedPreferences.getInstance();


  //User information
  var userName = Global.prefs.getString('username') ?? "" ;
  var password = Global.prefs.getString('password') ?? "";
  var token = Global.prefs.getString('token') ?? "";
  var phone = Global.prefs.getString('phone') ?? "";
  var name = Global.prefs.getString('name') ?? "";
  var gender = Global.prefs.getInt('gender') ?? 1;


  if (userName != "" && token != "") {

    User user = new User.loggedIn(userName,name,password,phone,gender);
    Global.loggedInUser = user;
    Global.userToken = token;

  }

  runApp(MainWidget());

}

class MainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AppLanguage(),
            ),
            ChangeNotifierProvider(
              create: (context) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => UserProvider(),
            ),
          ],
          child: Consumer<AppLanguage>(builder: (context, model, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: [
                  Locale('ar', 'EG'),
                  Locale('en', 'US'),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  // change widget LTR and RTL
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: HomePage()
            );
          }
          )
      );
  }

}



// this code for initiating OneSignal
/*
Future<void> initOneSignal() async {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.init('48827ead-9464-41b4-b54b-15d9cbf3b8b5',
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: false
      });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
  OneSignal.shared
      .setNotificationReceivedHandler((OSNotification notification) {});
  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    print('Clicked on');
  });
}
*/

