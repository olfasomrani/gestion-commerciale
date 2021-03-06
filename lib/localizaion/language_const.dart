import 'package:flutter/material.dart';
import 'package:essayee/localizaion/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String Anglais = "en";
const String Francais = "fr";
const String Arabe  = "ar";


Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case Anglais:
      return Locale(Anglais, "πΊπΈ");

    case Francais:
      return Locale(Francais, "π«π·");

    case Arabe:
      return Locale(Arabe, "πΉπ³");


    default:
      return Locale(Anglais,"πΊπΈ");
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
