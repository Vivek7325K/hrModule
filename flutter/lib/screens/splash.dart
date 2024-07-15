import '../controllers/auth_controller.dart';
import '../services/authService.dart';
import '../utilities/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.find<AuthenticationController>();


  fetch() async {
    bool isAuthenticated = await authController.authMe(false);
    if (isAuthenticated) {
      // todo.. do initial fetch
    } else {
      await Pref.write('token', "");
    }
    Get.offNamed('/auth');
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/splash_background.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Center(
                child: Image.asset('assets/splash_logo.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}