import 'package:flutter/material.dart';

class AppColors {
  static const kBlack = Color(0xFF3D3D4E);
  static const kGrey = Color(0xFFAEAEBC);
  static const kLightGrey = Color(0xFFECECF4);
  static const kRed = Color(0xFFEB4A56);
  static const kLightRed = Color(0xFFF49EA4);
  static const kLighterRed = Color(0xFFD9DC);
  static const kWhite = Colors.white;
}

final ThemeData kTheme = _buildmyTheme();
ThemeData _buildmyTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: AppColors.kWhite,
    backgroundColor: AppColors.kWhite,
    accentColor: AppColors.kRed,
    scaffoldBackgroundColor: AppColors.kWhite,
    errorColor: AppColors.kRed,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: AppColors.kRed,
      textTheme: ButtonTextTheme.normal,
    ),
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 25,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: 'Helvetica',
      ),
      title: TextStyle(
        fontSize: 20,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: 'Helvetica',
      ),
      subhead: TextStyle(
        fontSize: 16,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: 'Helvetica',
      ),
      body1: TextStyle(
        fontSize: 12,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: 'Helvetica',
      ),
      subtitle: TextStyle(
        fontSize: 12,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: 'Helvetica',
      ),
    ),
  );
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
