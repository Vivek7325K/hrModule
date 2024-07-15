import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utilities/pref.dart';

class AppTheme {
  AppTheme._();
  static RxBool isLightTheme = false.obs;

  static saveThemeStatus() async {
    await Pref.writeBool('theme', isLightTheme.value);
  }

  static getThemeStatus() async {
    var _isLight = await Pref.readBool('theme').obs;
    isLightTheme.value = await _isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      disabledColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: Color.fromARGB(178, 51, 51, 51),
        fontSize: 12.sp,
      ),
      labelMedium: TextStyle(
        color: Color.fromARGB(255, 51, 51, 51),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: Color.fromARGB(204, 51, 51, 51),
        fontSize: 14.sp,
        fontFamily: 'OpenSans',
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 51, 51, 51),
        fontSize: 13.sp,
      ),
      bodySmall: TextStyle(
        color: Color.fromARGB(153, 51, 51, 51),
        fontSize: 13.sp,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      disabledColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: Color.fromARGB(178, 255, 255, 255),
        fontSize: 12.sp,
      ),
      labelMedium: TextStyle(
        color: Color.fromARGB(255, 222, 226, 235),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: Color.fromARGB(204, 255, 255, 255),
        fontSize: 14.sp,
        fontFamily: 'OpenSans',
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 234, 231, 231),
        fontSize: 13.sp,
      ),
      bodySmall: TextStyle(
        color: Color.fromARGB(153, 255, 255, 255),
        fontSize: 13.sp,
      ),
    ),
  );
  //#646464
  static const Color backgroundColor = Color(0xFF16171c);
  //static const Color primaryColor = Color(0xFFf3c048);
  static const Color primaryColor = Color(0xFFF5C249);
  static const Color textColorDark = Color(0xFF888888);
  static const Color textColorLight = Color(0xFFFFFFFF);
  static const Color textColorLightDim = Color.fromARGB(160, 255, 255, 255);
  static const Color borderDark = Color(0xFF404040);
  static const Color borderLight = Color(0xFFEAEAEA);
  static const Color semiTransparent = Color.fromARGB(60, 0, 0, 0);
  static const Color textFieldsBG = Color(0xFF16161B);
  static const Color textFieldsBGLight = Color.fromARGB(127, 255, 255, 255);
  static const Color transparent = Color.fromARGB(2, 0, 0, 0);
  static const Color bottomNavigation = Color(0xFF242831);
  static const Color error = Color.fromARGB(255, 166, 76, 76);
  //static const Color grayTransparent = Color.fromARGB(255, 53, 54, 62);
  static const Color grayTransparent = Color.fromARGB(40, 255, 255, 255);
  static const Color greenAccent = Color(0xFFCFFFAA);
  static const Color redAccent = Color(0xFFF6ADAD);
  static const LinearGradient borderGradient = LinearGradient(
    colors: [
      Color.fromARGB(77, 255, 255, 255),
      Color.fromARGB(176, 117, 162, 245),
      Color.fromARGB(176, 162, 192, 247),
      Color.fromARGB(176, 252, 253, 255)
    ],
  );

  static TextStyle textLight = TextStyle(color: Colors.white, fontSize: 16.sp);
  static TextStyle textDark = TextStyle(color: Colors.black, fontSize: 16.sp);
}
