// //packages
import 'package:find_tutors/utils/change_screen.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//screens
import 'signup.dart';

class SignInWidget extends StatefulWidget {
  final List screens;
  final Function changeScreen;
  SignInWidget({this.screens, this.changeScreen});
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
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

class SigninPage extends StatelessWidget {
  final Function changeScreen;
  const SigninPage({
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
              Colors.black.withOpacity(0.10), BlendMode.dstATop),
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
        // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
        //     Container(
        //       decoration: BoxDecoration(
        //         border: Border(
        //           bottom: BorderSide(
        //               color: CommonColors.primary,
        //               width: 0.5,
        //               style: BorderStyle.solid),
        //         ),
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           // new Padding(
        //           //   padding:
        //           //       EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
        //           //   child: Icon(
        //           //     FeatherIcons.mail,
        //           //     color: CommonColors.primary,
        //           //     size: 20.0,
        //           //   ),
        //           // ),
        //           new Expanded(
        //             child: TextField(
        //               textAlign: TextAlign.left,
        //               style: TextStyle(color: CommonColors.primary),
        //               decoration: InputDecoration(
        //                   // labelText: "Username",
        //                   // contentPadding: EdgeInsets.only(bottom: 0.0),
        //                   border: InputBorder.none,
        //                   hintText: 'Enter your email',
        //                   labelStyle: TextStyle(color: CommonColors.primary),

        //                   // hintStyle: TextStyle(color: CommonColors.primary),
        //                   icon: Icon(
        //                     FeatherIcons.mail,
        //                     size: 20.0,
        //                   )),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //         border: Border(
        //           bottom: BorderSide(
        //               color: CommonColors.primary,
        //               width: 0.5,
        //               style: BorderStyle.solid),
        //         ),
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           new Padding(
        //             padding:
        //                 EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
        //             child: Icon(
        //               FeatherIcons.lock,
        //               color: CommonColors.primary,
        //               size: 20.0,
        //             ),
        //           ),
        //           new Expanded(
        //             child: TextField(
        //               textAlign: TextAlign.left,
        //               decoration: InputDecoration(
        //                 // labelText: "Username",
        //                 // contentPadding: EdgeInsets.only(bottom: 0.0),
        //                 border: InputBorder.none,
        //                 hintText: 'Enter your password',
        //                 hintStyle: TextStyle(color: CommonColors.primary),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     new GestureDetector(
        //       onTap: () {
        //         Navigator.of(context, rootNavigator: true).push(
        //           new MaterialPageRoute<bool>(
        //             fullscreenDialog: true,
        //             builder: (BuildContext context) => new ResetPasswordPage(),
        //           ),
        //         );
        //       },
        //       child: new Text(
        //         "Forgot Password?",
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 20.0,
        //     ),
        //     Container(
        //         padding: EdgeInsets.symmetric(
        //           vertical: 0.0,
        //         ),
        //         width: double.infinity,
        //         child: GradientButton(
        //           onPressed: () {},
        //           text: Constants.signin,
        //         )),
        //   ],
        // ),
        // padding: EdgeInsets.only(top: 23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    height: 230.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Email",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          height: 38.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 13.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                  size: 22.0,
                                ),
                              ),
                              Container(
                                height: 20.0,
                                width: 1.0,
                                color: Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.only(
                                    left: 00.0, right: 10.0),
                              ),
                              new Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Password",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          height: 38.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 13.0),
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.grey,
                                  size: 22.0,
                                ),
                              ),
                              Container(
                                height: 20.0,
                                width: 1.0,
                                color: Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.only(
                                    left: 00.0, right: 10.0),
                              ),
                              new Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 25.0),
                        //   decoration: BoxDecoration(
                        //     border: Border(
                        //       bottom: BorderSide(
                        //           color: CommonColors.primary,
                        //           width: 0.5,
                        //           style: BorderStyle.solid),
                        //     ),
                        //   ),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       // new Padding(
                        //       //   padding:
                        //       //       EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                        //       //   child: Icon(
                        //       //     FeatherIcons.mail,
                        //       //     color: CommonColors.primary,
                        //       //     size: 20.0,
                        //       //   ),
                        //       // ),
                        //       new Expanded(
                        //         child: TextField(
                        //           textAlign: TextAlign.left,
                        //           style: TextStyle(color: CommonColors.primary),
                        //           decoration: InputDecoration(
                        //               // labelText: "Username",
                        //               // contentPadding: EdgeInsets.only(bottom: 0.0),
                        //               border: InputBorder.none,
                        //               hintText: 'Enter your email',
                        //               labelStyle: TextStyle(
                        //                   color: CommonColors.primary),

                        //               // hintStyle: TextStyle(color: CommonColors.primary),
                        //               icon: Icon(
                        //                 FeatherIcons.mail,
                        //                 size: 20.0,
                        //               )),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.0,
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 25.0),
                        //   decoration: BoxDecoration(
                        //     border: Border(
                        //       bottom: BorderSide(
                        //           color: CommonColors.primary,
                        //           width: 0.5,
                        //           style: BorderStyle.solid),
                        //     ),
                        //   ),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       new Padding(
                        //         padding: EdgeInsets.only(
                        //             top: 10.0, bottom: 10.0, right: 15.0),
                        //         child: Icon(
                        //           FeatherIcons.lock,
                        //           color: CommonColors.primary,
                        //           size: 20.0,
                        //         ),
                        //       ),
                        //       new Expanded(
                        //         child: TextField(
                        //           textAlign: TextAlign.left,
                        //           decoration: InputDecoration(
                        //             // labelText: "Username",
                        //             // contentPadding: EdgeInsets.only(bottom: 0.0),
                        //             border: InputBorder.none,
                        //             hintText: 'Enter your password',
                        //             hintStyle:
                        //                 TextStyle(color: CommonColors.primary),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        //   child: TextField(
                        //     focusNode: myFocusNodeEmailLogin,
                        //     controller: loginEmailController,
                        //     keyboardType: TextInputType.emailAddress,
                        //     style: TextStyle(
                        //         fontFamily: "WorkSansSemiBold",
                        //         fontSize: 16.0,
                        //         color: Colors.black),
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       icon: Icon(
                        //         FontAwesomeIcons.envelope,
                        //         color: Colors.black,
                        //         size: 22.0,
                        //       ),
                        //       hintText: "Email Address",
                        //       hintStyle: TextStyle(
                        //           fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                        //     ),
                        //   ),
                        // ),

                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        //   child: TextField(
                        //     focusNode: myFocusNodePasswordLogin,
                        //     controller: loginPasswordController,
                        //     obscureText: _obscureTextLogin,
                        //     style: TextStyle(
                        //         fontFamily: "WorkSansSemiBold",
                        //         fontSize: 16.0,
                        //         color: Colors.black),
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       icon: Icon(
                        //         FontAwesomeIcons.lock,
                        //         size: 22.0,
                        //         color: Colors.black,
                        //       ),
                        //       hintText: "Password",
                        //       hintStyle: TextStyle(
                        //           fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                        //       suffixIcon: GestureDetector(
                        //         onTap: _toggleLogin,
                        //         child: Icon(
                        //           FontAwesomeIcons.eye,
                        //           size: 15.0,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 215.0),
                    alignment: Alignment.centerRight,
                    width: 200.0,
                    child: GradientButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Student())),
                      text: Constants.signin,
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white10,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSansMedium"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white10,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
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
