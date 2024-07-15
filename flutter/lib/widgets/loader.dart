import '../theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.fill,
            //   image: AssetImage('assets/background.png'),
            // ),
            color: AppTheme.semiTransparent,
          ),
        ),
        const Center(
          child: CircularProgressIndicator(
            color: AppTheme.primaryColor,
          ),
        ),
      ],
    );
  }
}