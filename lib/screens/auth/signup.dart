//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:find_tutors/utils/icon_font.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailStudent = FocusNode();
  final FocusNode myFocusNodePasswordStudent = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextStudent = true;
  bool _obscureTextLogin = true;
  bool _obscureTextStudentConfirm = true;

  TextEditingController teacherEmailController = new TextEditingController();
  TextEditingController teacherNameController = new TextEditingController();
  TextEditingController teacherPasswordController = new TextEditingController();
  TextEditingController teacherConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;
  final resizeToAvoidBottomPadding = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height >= 775.0
            //     ? MediaQuery.of(context).size.height
            //     : 775.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.10), BlendMode.dstATop),
                image: AssetImage('assets/images/Map.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: new Image(
                      width: 170.0,
                      fit: BoxFit.fill,
                      image:
                          new AssetImage('assets/images/forgot_password.png')),
                ),
                Text(
                  'Choose an Identity',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: CommonColors.primary,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  // flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildStudent(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildTeacher(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // myFocusNodePassword.dispose();
    // myFocusNodeEmail.dispose();
    // myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  // void showInSnackBar(String value) {
  //   FocusScope.of(context).requestFocus(new FocusNode());
  //   _scaffoldKey.currentState?.removeCurrentSnackBar();
  //   _scaffoldKey.currentState.showSnackBar(new SnackBar(
  //     content: new Text(
  //       value,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 16.0,
  //           fontFamily: "WorkSansSemiBold"),
  //     ),
  //     backgroundColor: Colors.blue,
  //     duration: Duration(seconds: 3),
  //   ));
  // }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onStudentButtonPress,
                child: Text(
                  "Student",
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Teacher",
                  style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkboxValueC = false;
  void _value1Changed(bool value) => setState(() => checkboxValueC = value);

  Widget _buildStudent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Term & Conditions',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
              ),
            )
          ]),
          SizedBox(
            height: 10.0,
          ),
          Stack(
            // alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: new CheckboxListTile(
              value: checkboxValueC,
              onChanged: _value1Changed,
              title: new Text('I have read and accept the Term & Conditions'),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xFF4E54C8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  alignment: Alignment.centerRight,
                  width: 120.0,
                  child: GradientButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Student())),
                    text: 'Next',
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTeacher(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Term & Conditions',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
              ),
            )
          ]),
          SizedBox(
            height: 10.0,
          ),
          Stack(
            // alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: new CheckboxListTile(
              value: checkboxValueC,
              onChanged: _value1Changed,
              title: new Text('I have read and accept the Term & Conditions'),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xFF4E54C8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  alignment: Alignment.centerRight,
                  width: 120.0,
                  child: GradientButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Teacher())),
                    text: 'Next',
                  )),
            ],
          )
        ],
      ),
    );
  }

  void _onStudentButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  // void _toggleTeacher() {
  //   setState(() {
  //     _obscureTextTeacher = !_obscureTextTeacher;
  //   });
  // }

  // void _toggleTeacherConfirm() {
  //   setState(() {
  //     _obscureTextTeacherConfirm = !_obscureTextTeacherConfirm;
  //   });
  // }
}

class TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  TabIndicationPainter(
      {this.dxTarget = 110.0,
      this.dxEntry = 20.0,
      this.radius = 16.0,
      this.dy = 20.0,
      this.pageController})
      : super(repaint: pageController) {
    painter = new Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;
    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = new Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = new Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, Color(0xbdc3c7), 2.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}

class Student extends StatefulWidget {
  @override
  _StudentWidgetState createState() => new _StudentWidgetState();
}

class _StudentWidgetState extends State<Student> {
  String gender = 'male';
  handleGenderChange(String val) {
    setState(() {
      gender = val;
    });
  }

  // void _toggleLogin() {
  //   setState(() {
  //     _obscureTextLogin = !_obscureTextLogin;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Text(
                  'Signup With',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Material(
                        elevation: 5.0,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: CommonColors.kitGradients,
                            )),
                            child: Center(
                              child: Icon(FeatherIcons.facebook,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Material(
                        elevation: 5.0,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: CommonColors.kitGradients,
                            )),
                            child: Center(
                              child:
                                  Icon(Icons.golf_course, color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                ],
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
                              Colors.amber,
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
                            color: Colors.amber,
                            fontSize: 16.0,
                            fontFamily: "WorkSansMedium"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.amber,
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
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          // image: new DecorationImage(
                          //   fit: BoxFit.fill,
                          //   image: NetworkImage(
                          //       "https://avatars2.githubusercontent.com/u/3234592?s=460&v=4"),
                          // ),
                          border: Border.all(
                              color: CommonColors.primary,
                              width: 2.0,
                            ),
                            
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50.0),
                          onTap: (){},
                          child: Ink(
                            child: Align(
                              child: Text('Add Photo'),
                            ),
                          )
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20.0),
                            width: MediaQuery.of(context).size.width - 160,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Expanded(
                                  child: TextField(
                                    style:
                                        TextStyle(color: CommonColors.primary),
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Khmer Name',
                                      icon: Icon(
                                        FeatherIcons.user,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0),
                            width: MediaQuery.of(context).size.width - 160,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Expanded(
                                  child: TextField(
                                    style:
                                        TextStyle(color: CommonColors.primary),
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'English Name',
                                      icon: Icon(
                                        FeatherIcons.user,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: RadioListTile(
                          title: const Text('Male'),
                          groupValue: gender,
                          value: "male",
                          activeColor: CommonColors.accent,
                          onChanged: (String val) => handleGenderChange(val),
                        ),
                      ),
                      Container(
                        width: 150.0,
                        child: RadioListTile(
                          title: const Text('Female'),
                          groupValue: gender,
                          value: "female",
                          activeColor: CommonColors.accent,
                          onChanged: (String val) => handleGenderChange(val),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: CommonColors.primary),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          icon: Icon(
                            FeatherIcons.phone,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: CommonColors.primary),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          icon: Icon(
                            FeatherIcons.mail,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: CommonColors.primary),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Date of Birth',
                          icon: Icon(
                            FeatherIcons.calendar,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: CommonColors.primary),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          icon: Icon(
                            FeatherIcons.lock,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: CommonColors.primary),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Address',
                          icon: Icon(
                            FeatherIcons.map_pin,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      alignment: Alignment.centerRight,
                      width: 160.0,
                      child: GradientButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Student())),
                        text: 'Create Account',
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Teacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Teacher Sign Up'),
    );
  }
}
