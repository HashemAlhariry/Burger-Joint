import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'Screens/home_page.dart';
import 'Utils/app_localizations.dart';


void main() async {

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
          ));
  }
}


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

