import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppLocalizations {

   late Locale locale;
   AppLocalizations(this.locale);


  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;
  Future<bool> load() async {

    String jsonString =
    await rootBundle.loadString('languages/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String,dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }


  String? translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;

}

class AppLanguage extends ChangeNotifier {


  Locale _appLocale = Locale('en');
  Locale  appLocal(String string){

    _appLocale = Locale(string);
   return  _appLocale;
  }



  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code') ?? 'en') ;
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();

    if (_appLocale == type) {
      return;
    }

    if (type == Locale("ar")) {

      _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', 'EG');

    }

    else {

      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');

    }

    notifyListeners();
  }


}