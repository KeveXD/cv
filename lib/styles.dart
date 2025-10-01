import 'package:flutter/material.dart';

// Színkonstansok a CSS alapján
const Color primaryTextColor = Color(0xFF333333);
const Color secondaryTextColor = Color(0xFF7f8c8d);
const Color sidebarBgColor = Color(0xFF2c3e50);
const Color sidebarTextColor = Colors.white;
const Color sidebarMutedTextColor = Color(0xFFaebfd0);
const Color dividerColor = Color(0xFFbdc3c7);
const Color sidebarDividerColor = Color(0xFF5d758c);

// Általános stílusok
abstract class CvStyles {
  // Fő címsor (Balla Keve)
  static const TextStyle mainTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 48,
    fontWeight: FontWeight.w900,
    color: primaryTextColor,
    height: 1,
  );

  // Alcímsor (Mobil szoftverfejlesztő)
  static const TextStyle subTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: secondaryTextColor,
  );

  // Fő tartalom szakasz címe
  static const TextStyle mainSectionTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: primaryTextColor,
  );

  // Oldalsáv szakasz címe
  static const TextStyle sidebarSectionTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: sidebarTextColor,
  );

  // Fő tartalom szöveg
  static const TextStyle mainTextStyle = TextStyle(
    fontSize: 15,
    height: 1.6,
    color: primaryTextColor,
  );
}