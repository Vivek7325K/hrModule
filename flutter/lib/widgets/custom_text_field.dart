import '../theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText, label;
  String? errorText;
  bool obscureText, capitalizeText;
  Color fillColor, textColor, hintTextColor;
  int maxLines;
  TextInputType textInputType;
  CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.obscureText,
    this.capitalizeText = false,
    this.errorText,
    this.fillColor = AppTheme.textFieldsBG,
    this.hintTextColor = AppTheme.textColorDark,
    this.textColor = AppTheme.textColorLight,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10.r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return label != ''
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppTheme.textColorDark,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                style: errorText == null
                    ? TextStyle(color: textColor, fontSize: 13.sp)
                    : TextStyle(
                        color: Color.fromARGB(255, 176, 79, 79),
                        fontSize: 13.sp),
                cursorColor: errorText == null
                    ? AppTheme.primaryColor
                    : Color.fromARGB(255, 176, 79, 79),
                obscureText: obscureText,
                maxLines: maxLines,
                keyboardType: textInputType,
                textCapitalization: capitalizeText
                    ? TextCapitalization.characters
                    : TextCapitalization.none,
                decoration: InputDecoration(
                  errorText: errorText,
                  hintText: hintText,
                  hintStyle: errorText == null
                      ? TextStyle(color: hintTextColor)
                      : TextStyle(color: Color.fromARGB(255, 176, 79, 79)),
                  filled: true,
                  fillColor: errorText == null ? fillColor : Color(0xFF251B1B),
                  enabledBorder: _border(AppTheme.borderDark),
                  focusedBorder: _border(AppTheme.primaryColor),
                  errorBorder: _border(AppTheme.error),
                  focusedErrorBorder: _border(AppTheme.error),
                ),
              ),
            ],
          )
        : TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            style: errorText == null
                ? TextStyle(color: textColor, fontSize: 13.sp)
                : TextStyle(
                    color: Color.fromARGB(255, 176, 79, 79), fontSize: 13.sp),
            cursorColor: errorText == null
                ? AppTheme.primaryColor
                : Color.fromARGB(255, 176, 79, 79),
            obscureText: obscureText,
            maxLines: maxLines,
            keyboardType: textInputType,
            textCapitalization: capitalizeText
                ? TextCapitalization.characters
                : TextCapitalization.none,
            decoration: InputDecoration(
              errorText: errorText,
              hintText: hintText,
              hintStyle: errorText == null
                  ? TextStyle(color: hintTextColor)
                  : TextStyle(color: Color.fromARGB(255, 176, 79, 79)),
              filled: true,
              fillColor: errorText == null ? fillColor : Color(0xFF251B1B),
              enabledBorder: _border(AppTheme.borderDark),
              focusedBorder: _border(AppTheme.primaryColor),
              errorBorder: _border(AppTheme.error),
              focusedErrorBorder: _border(AppTheme.error),
            ),
          );
  }
}