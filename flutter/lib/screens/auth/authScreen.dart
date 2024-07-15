import '../../services/authService.dart';
import '../../theme/app_theme.dart';
import '../../utilities/pref.dart';
import '../../widgets/animated_toggle.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _toggleValue = 0;
  bool loading = false;
  String _phonePrefix = '(+91) India';
  String? emailErr,
      passwordErr,
      confirmPasswordErr,
      phoneNumberErr,
      referralCodeErr;

  List<String> socials = [
    "assets/icons/apple.png",
    "assets/icons/facebook.png",
    "assets/icons/twitter.png"
  ];

  Future<void> checkToken() async {
    AuthenticationService authService = AuthenticationService();
    String token = await authService.getAtuthToken();
    if (token != "") {
      Get.offNamed('/dashboard');
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Widget _socialIcon(int index) {
    return GestureDetector(
      onTap: () {
        print(socials.elementAt(index));
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFF262629),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Image.asset(
            socials.elementAt(index),
          ),
        ),
      ),
    );
  }

  void loginWithEmailAndPassword() {
    AuthenticationService auth = AuthenticationService();

    auth
        .loginWithEmail(
            email: widget.emailController.text,
            password: widget.passwordController.text)
        .then((response) async {
      print(response);
      print(!response.isEmpty);
      if (response.isEmpty) {
        setState(() {
          loading = false;
        });
        Get.offNamed('/dashboard');
      } else {
        setState(() {
          passwordErr = response;
          loading = false;
        });
      }
    });
  }

  void signupWithEmailAndPassword() {
    AuthenticationService auth = AuthenticationService();

    auth
        .signup(
      email: widget.emailController.text,
      password: widget.passwordController.text,
      phoneNumber: widget.phoneNumberController.text,
      phonePrefix: _phonePrefix
          .split(' ')[0]
          .replaceFirst('(', '')
          .replaceFirst(')', ''),
      referralCode: widget.referralCodeController.text,
    )
        .then((response) async {
      if (!response.isEmpty) {
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        Get.offNamed('/dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/background.png'),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                //height: Get.height * 1.10,
                margin: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 80.w,
                      height: 80.h,
                    ),
                    SizedBox(height: 6.h),
                    AnimatedToggle(
                      values: ['Log In', 'Register'],
                      onToggleCallback: (value) {
                        setState(() {
                          _toggleValue = value;
                          emailErr = null;
                          passwordErr = null;
                        });
                      },
                      textColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: widget.emailController,
                      label: 'Email address',
                      hintText: 'you@example.com',
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      textColor: AppTheme.primaryColor,
                      errorText: emailErr,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: widget.passwordController,
                      label: 'Password',
                      hintText: 'Your password',
                      obscureText: true,
                      textColor: AppTheme.primaryColor,
                      errorText: passwordErr,
                    ),
                    _toggleValue == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              CustomTextField(
                                controller: widget.confirmPasswordController,
                                label: 'Confirm Password',
                                hintText: 'Confirm password',
                                obscureText: true,
                                textColor: AppTheme.primaryColor,
                                errorText: confirmPasswordErr,
                              ),
                              SizedBox(height: 10.h),
                              const Text(
                                'Phone number',
                                style: TextStyle(color: AppTheme.textColorDark),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.r),
                                    margin: phoneNumberErr == null
                                        ? EdgeInsets.only(right: 10.w)
                                        : EdgeInsets.only(
                                            right: 10.w,
                                            bottom: 22.h,
                                          ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.textFieldsBG,
                                      border: Border.all(
                                          color: AppTheme.borderDark),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButton<String>(
                                      underline: const SizedBox(),
                                      dropdownColor: AppTheme.textFieldsBG,
                                      style: const TextStyle(
                                          color: AppTheme.primaryColor),
                                      value: _phonePrefix,
                                      items: <String>[
                                        '(+91) India',
                                        '(+355) Albania',
                                        '(+213) Algeria',
                                        '(+39) Italy'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 13.sp),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _phonePrefix = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: widget.phoneNumberController,
                                      label: '',
                                      hintText: 'Phone number',
                                      obscureText: false,
                                      textInputType: TextInputType.number,
                                      textColor: AppTheme.primaryColor,
                                      errorText: phoneNumberErr,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              CustomTextField(
                                controller: widget.referralCodeController,
                                label: 'Referral Code',
                                hintText: 'Referral Code',
                                obscureText: false,
                                textColor: AppTheme.primaryColor,
                                errorText: referralCodeErr,
                                capitalizeText: true,
                              ),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            emailErr = null;
                            passwordErr = null;
                            confirmPasswordErr = null;
                            phoneNumberErr = null;

                            referralCodeErr = null;
                            loading = true;
                          });
                          if (_toggleValue == 0) {
                            if (widget.emailController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                emailErr = 'Field cannot be blank';
                              });
                            } else if (!(RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(widget.emailController.text))) {
                              setState(() {
                                loading = false;
                                emailErr = 'Invalid email address';
                              });
                            } else if (widget.passwordController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                passwordErr = 'Field cannot be blank';
                              });
                            } else {
                              loginWithEmailAndPassword();
                            }
                          } else {
                            if (widget.emailController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                emailErr = 'Field cannot be blank';
                              });
                            } else if (!(RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(widget.emailController.text))) {
                              setState(() {
                                loading = false;
                                emailErr = 'Invalid email address';
                              });
                            } else if (widget.passwordController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                passwordErr = 'Field cannot be blank';
                              });
                            } else if (widget
                                .confirmPasswordController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                confirmPasswordErr = 'Field cannot be blank';
                              });
                            } else if (widget
                                .phoneNumberController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                phoneNumberErr = 'Field cannot be blank';
                              });
                            } else if (widget
                                .referralCodeController.text.isEmpty) {
                              setState(() {
                                loading = false;
                                referralCodeErr = 'Field cannot be blank';
                              });
                            } else {
                              if (widget.passwordController.text !=
                                  widget.confirmPasswordController.text) {
                                setState(() {
                                  loading = false;
                                  passwordErr = 'Passwords don\'t match';
                                  confirmPasswordErr = 'Passwords don\'t match';
                                });
                              } else {
                                signupWithEmailAndPassword();
                              }
                            }
                          }
                        },
                        child: Text(
                          _toggleValue == 0 ? 'Sign In' : 'Sign Up',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _toggleValue == 0
                        ? SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: 46.h),
                    _toggleValue == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign in with',
                                style: TextStyle(
                                    color: AppTheme.textColorDark,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _socialIcon(0),
                                  SizedBox(width: 10.w),
                                  _socialIcon(1),
                                  SizedBox(width: 10.w),
                                  _socialIcon(2),
                                ],
                              )
                            ],
                          )
                        : SizedBox(),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          loading ? Loader() : SizedBox(),
        ]),
      ),
    );
  }
}
