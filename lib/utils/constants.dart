import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
class Routes {
  static const String homeRoute = "/home";
  static const String mapRoute = "/map";
  static const String signinRoute = "/signin";
  static const String notFoundRoute = "/notFound";
  static const String profileRoute = "/profile";
  static const String tutorsDetailRoute = "/tutorsDetail";
}

class ScreenHelper {
  static const String signin = "Signin";
  static const String profile = "Profile";
  static const String subjectList = "Subject";
  static const String subjectDetail = "Subject Detail";
  static const String postList = "Post";
  static const String postDetail = "Post Detail";
}

class Fonts {
  static const String quickFont = "Quicksand";
  static const String abelFont = "Abel";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";
}

class Images {
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
}

class AppColors {
  static const MaterialColor ui_kit_color = Colors.grey;
// Colors
  static const kShrinePink50 = const Color(0xFFFEEAE6);
  static const kShrinePink100 = const Color(0xFFFEDBD0);
  static const kShrinePink300 = const Color(0xFFFBB8AC);
  static const kShrineBrown900 = const Color(0xFF442B2D);
  static const kShrineErrorRed = const Color(0xFFC5032B);
  static const kShrineSurfaceWhite = const Color(0xFFFFFBFA);
  static const kShrineBackgroundWhite = const Color(0xFFFFFFFF);
  static const kShrineExodus = const Color(0xFF6c5ce7);
  static const kShrineLynxWhite = const Color(0xFFf5f6fa);
  static const kShrineElectromagnetic = const Color(0xFF2f3640);

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

class Constants {
  static const String appName = "Find Tutors";
  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String signin = "SIGNIN";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";
  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String reset_password = "SENT PASSWORD RESET CODE";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";
}
