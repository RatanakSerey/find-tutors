import 'dart:math';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String root = "/root";
  static const String home = "/home";
  static const String map = "/map";
  static const String signin = "/signin";
  static const String signup = "/signup";
  static const String resetPassword = "/reset_password";
  static const String notFound = "/not_found";
  static const String studentProfile = "/student_profile";
  static const String teacherProfile = "/teacher_profile";
  static const String tutorsDetail = "/tutors_detail";
  static const String studentSignup = "/student_signup";
  static const String teacherSignup = "/teacher_signup";
}

class ScreenHelper {
  static const String signin = "Signin";
  static const String teacherProfile = "Teacher Profile";
  static const String studentProfile = "Student Profile";
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

class MethodNames {
  // static const String serverUrl= "http://192.168.43.3:3000";
  static const String serverUrl = "http://192.168.1.101:3000";
  //subject
  static String findSubject = "$serverUrl/find_subject/";
  //user
  static String insertUser = "$serverUrl/insert_user/";
  //student
  static String insertStudent = "$serverUrl/insert_student/";

}

//
// 403: forbidden
// 404: not found
// 200: ok
// 201: created
// 304: not modified
class Constants {
  static const String appName = "Find Tutors";
  static const String version = "0.0.1";
  static const String FORBIDDEN = "403";
  static const String NOT_FOUND = "404";
  static const String OK = "200";
  static const String CREATED = "201";
  static const String NOT_MODIFIED = "304";
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

  static storageRef(FirebaseStorage storage, String path, String filename) {
    return storage.ref().child(path).child(filename);
  }
}
