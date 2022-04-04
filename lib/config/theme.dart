import 'package:flutter/material.dart';
ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.black,
    // primaryColorDark: Color(0xFFFC0028),
    // primaryColorLight: Color(0xFFFE9AAA),
    // colorScheme: ColorScheme.fromSwatch().copyWith(
    //       secondary: Color(0XFFFFC547),
        // ),

    fontFamily: 'IM Fell Great Primer',
    textTheme: const TextTheme(
      //INFO UNITY STUDY TELA INICIAL
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      //REGISTRO E LOGIN LETRA MAIOR E BOTAO
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      //INFO UNITY STUDY APPBAR
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      //QUAL É A BOA E USER
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      //TEXTO DENTRO DO CARD
      headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      //TAG
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
  );
}