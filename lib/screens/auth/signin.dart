// //packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';
import 'package:find_tutors/utils/icon_font.dart';
//screens
import 'signup.dart';
import 'reset_password.dart';

class SigninPage extends StatefulWidget {
  final List screens;
  final Function changeScreen;
  SigninPage({this.screens, this.changeScreen});
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeScreen(
        screen: widget.screens[widget.screens.length - 1],
        changeScreen: widget.changeScreen,
      ),
    );
  }
}

class SignInWidget extends StatelessWidget {
  final Function changeScreen;
  const SignInWidget({
    this.changeScreen,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height -
          kBottomNavigationBarHeight -
          28.0,
      decoration: BoxDecoration(
        color: Colors.white10,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.20), BlendMode.dstATop),
          image: AssetImage('assets/images/Map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginHeader(),
            SizedBox(
              height: 30.0,
            ),
            loginFields(context),
            loginFooter(context)
            // ChangeScreen(screen: this.screens[this.screens.length - 1])
          ]),
    ));
  }

  loginHeader() => Container(
          // margin: new EdgeInsets.only(top: 70.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to ${Constants.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
        ],
      ));
  loginFields(context) => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: CommonColors.primary,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // new Padding(
                  //   padding:
                  //       EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                  //   child: Icon(
                  //     FeatherIcons.mail,
                  //     color: CommonColors.primary,
                  //     size: 20.0,
                  //   ),
                  // ),
                  new Expanded(
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: TextStyle(color: CommonColors.primary),
                      decoration: InputDecoration(
                        // labelText: "Username",
                        // contentPadding: EdgeInsets.only(bottom: 0.0),
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        labelStyle: TextStyle(color: CommonColors.primary),

                        // hintStyle: TextStyle(color: CommonColors.primary),
                        icon: Icon(FeatherIcons.mail,  size: 20.0,)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: CommonColors.primary,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                    child: Icon(
                      FeatherIcons.lock,
                      color: CommonColors.primary,
                      size: 20.0,
                    ),
                  ),
                  new Expanded(
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // labelText: "Username",
                        // contentPadding: EdgeInsets.only(bottom: 0.0),
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: CommonColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  new MaterialPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => new ResetPasswordPage(),
                  ),
                );
              },
              child: new Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0,
                ),
                width: double.infinity,
                child: GradientButton(
                  onPressed: () {},
                  text: Constants.signin,
                )),
          ],
        ),
      );
  loginFooter(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10.0),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  new CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => new SignupPage(),
                  ),
                );
              },
              child: new Text(
                "Dont have account? Sign Up",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}

//   final Color backgroundColor1;
//   final Color backgroundColor2;
//   final Color highlightColor;
//   final Color foregroundColor;
//   final AssetImage logo;

//   // SignInWidget({Key k, this.backgroundColor1, this.backgroundColor2, this.highlightColor, this.foregroundColor, this.logo});

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//         color: Colors.white10,
//         image: DecorationImage(
//           colorFilter: new ColorFilter.mode(
//               Colors.black.withOpacity(0.25), BlendMode.dstATop),
//           image: AssetImage('assets/images/Map.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 120.0),
//             child: Column(
//               children: <Widget>[
//                 FlutterLogo(
//                   colors: Colors.green,
//                   size: 80.0,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   "Welcome to ${Constants.appName}",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Colors.green),
//                 ),
//               ],
//             ),
//           ),
//           new Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//             // margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                     color: CommonColors.primary,
//                     width: 0.5,
//                     style: BorderStyle.solid),
//               ),
//             ),
//             padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 new Padding(
//                   padding:
//                       EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
//                   child: Icon(
//                     Icons.alternate_email,
//                     color: CommonColors.primary,
//                   ),
//                 ),
//                 new Expanded(
//                   child: TextField(
//                     textAlign: TextAlign.left,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Enter your email',
//                       hintStyle: TextStyle(color: CommonColors.primary),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           new Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//             // margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                     color: CommonColors.primary,
//                     width: 0.5,
//                     style: BorderStyle.solid),
//               ),
//             ),
//             padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 new Padding(
//                   padding:
//                       EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
//                   child: Icon(
//                     Icons.alternate_email,
//                     color: CommonColors.primary,
//                   ),
//                 ),
//                 new Expanded(
//                   child: TextField(
//                     textAlign: TextAlign.left,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Enter your password',
//                       hintStyle: TextStyle(color: CommonColors.primary),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//               padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//               width: double.infinity,
//               child: GradientButton(
//                 onPressed: () {},
//                 text: Constants.signin,
//               )),
//           Container(
//             margin: const EdgeInsets.only(top: 20.0),
//             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//             child: new Row(
//               children: <Widget>[
//                 new Expanded(
//                   child: FlatButton(
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(30.0)),
//                     color: Colors.transparent,
//                     child: Container(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "DON'T HAVE AN ACCOUNT?",
//                         style: TextStyle(color: CommonColors.primary),
//                       ),
//                     ),
//                     onPressed: () => {},
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path p = new Path();
//     p.lineTo(size.width, 0.0);
//     p.lineTo(size.width, size.height * 0.85);
//     p.arcToPoint(
//       Offset(0.0, size.height * 0.85),
//       radius: const Radius.elliptical(50.0, 10.0),
//       rotation: 0.0,
//     );
//     p.lineTo(0.0, 0.0);
//     p.close();
//     return p;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return true;
//   }
// }
