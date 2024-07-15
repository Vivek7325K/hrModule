import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';

AppBar ApplicationAppBar({
  String? appBarTitle,
  TextStyle? appTextStyle,
  FontWeight? fontWeight,
  double? fontSize,
  Color? backgroundColor,
  AppBar? appBar,
  List<Widget>? actions,
  double? elevation,
  required BuildContext context,
}) {
  return appBar ??
      AppBar(
        leadingWidth: 30,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   // 'assets/images/name_compress.png',
              //   //  width: 80,
              //   // height: 60,
              //   'assets/icons/icon.png',
              //   width: 20,
              //   height: 20,
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              if (appBarTitle != null)
                Text(
                  "$appBarTitle ",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
            ]),

        // appBarTitle != null
        //     ? Text(
        //         appBarTitle,
        //         style: appTextStyle ??
        //             context.textTheme.bodyText1!.copyWith(
        //               fontWeight: fontWeight,
        //               fontSize: fontSize ?? (height * 0.024).toInt().sp,
        //             ),
        //       )
        //     : Center(child: Image.asset('assets/images/logo.png')),
        //   backgroundColor: Colors.grey,
        //   title: ,

        /*
        Icon(
          Icons.notifications,
          color: Colors.white,
        )
         */
        backgroundColor: Colors.transparent,
        actions: actions,
        elevation: elevation,
      );
}
