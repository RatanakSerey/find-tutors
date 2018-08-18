import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  //routes
  static const String homeRoute = "/home";
  static const String mapRoute = "/map";
  static const String signinRoute = "/signin";
  static const String notFoundRoute = "/notFound";
  static const String profileRoute = "/profile";
  static const String tutorsDetailRoute = "/tutorsDetail";

  static const String timelineTwoRoute = "/tweets";
  static const String settingsOneRoute = "/deviceSettings";
  static const String shoppingOneRoute = "/shoppingList";
  static const String shoppingTwoRoute = "/shoppingDetails";
  static const String shoppingThreeRoute = "/productDetails";
  static const String paymentOneRoute = "/creditCard";
  static const String paymentTwoRoute = "/paymentSuccess";
  static const String loginOneRoute = "/loginWithOTP";
  static const String loginTwoRoute = "/login2";
  static const String dashboardOneRoute = "/dashboard1";

  //strings
  static const String appName = "Find Tutors";

  //screen helpers
  static const String signin = "Signin";
  static const String profile = "Profile";
  static const String subjectList = "Subject List";
  static const String subjectDetail = "Subject Detail";
  static const String tutorsList = "Tutors List";
  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  static const String pkImage = "$imageDir/app-icon.png";
  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";

  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String login = "Login";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  static const MaterialColor ui_kit_color = Colors.grey;

//colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Color(0xFF4E54C8),
    Color(0xFF8F94FB),
  ];
  static List<Color> kitGradients2 = [
    Color(0xffb7ac50),
    Colors.orange.shade900
  ];

  //randomcolor
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
