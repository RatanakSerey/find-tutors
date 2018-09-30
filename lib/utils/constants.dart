import 'dart:math';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String rootRoute = "/root";
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
  static const String regular = "";
  static const String bold = "";
  static const String italic = "";

  static const String quickFont = "Quicksand";
  static const String abelFont = "Abel";
  static const String dinNextFont = "DinNext";
  static const String khBoeungFont = "KhBoeung";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";
  static const String kantumruy = "Kantumruy";
}

class Images {
  static const String imageDir = "assets/images";
  static const String appIcon = "$imageDir/app_icon_512.png";
  static const String imagePlaceholder = "$imageDir/image_placeholder.png";
  static const String noImagePlaceholder = "$imageDir/no_image_placeholder.png";
  static const String notFound = "$imageDir/not_found.png";
  // static const String profileImage = "$imageDir/profile.jpg";
  // static const String blankImage = "$imageDir/blank.jpg";
  // static const String dashboardImage = "$imageDir/dashboard.jpg";
  // static const String loginImage = "$imageDir/login.jpg";
  // static const String paymentImage = "$imageDir/payment.jpg";
  // static const String settingsImage = "$imageDir/setting.jpeg";
  // static const String shoppingImage = "$imageDir/shopping.jpeg";
  // static const String timelineImage = "$imageDir/timeline.jpeg";
  // static const String verifyImage = "$imageDir/verification.jpg";
}

class CommonColors {
  static const primary = Color(0xFF4E54C8);
  static const secondary = Color(0xFF8F94FB);
  static const accent = Color(0xFF000000);
  static const black = Color(0xFF000000);
  static const success = Color(0xFF000000);
  static const warning = Color(0xFF000000);
  static const danger = Color(0xFFfb4740);
  static const info = Color(0xFF4dd1f4);

  static List<Color> kitGradients = [primary, secondary];
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

class MethodNames{
  static const String serverUrl= "http://192.168.1.111:3000";
  static String findSubject = "$serverUrl/find_subject/";
}

class Constants {
  static const String appName = "Find Tutors";
  static const String version = "0.0.1";
  //login
  // static const String enter_code_label = "Phone Number";
  // static const String enter_code_hint = "10 Digit Phone Number";
  // static const String enter_otp_label = "OTP";
  // static const String enter_otp_hint = "4 Digit OTP";
  // static const String get_otp = "Get OTP";
  // static const String resend_otp = "Resend OTP";
  // static const String signin = "SIGNIN";
  // static const String enter_valid_number = "Enter 10 digit phone number";
  // static const String enter_valid_otp = "Enter 4 digit otp";
  //generic
  // static const String error = "Error";
  // static const String success = "Success";
  // static const String ok = "OK";
  // static const String reset_password = "SENT PASSWORD RESET CODE";
  // static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  static storageRef(FirebaseStorage storage, String path, String filename){
    return storage.ref().child(path).child(filename);
  }
}
