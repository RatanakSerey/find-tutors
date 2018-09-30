//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/utils/modal_sheet.dart';
import 'package:find_tutors/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTwoPage extends StatefulWidget {
  final Function changeScreen;

  ProfileTwoPage({this.changeScreen});

  @override
  _ProfileTwoPageState createState() => new _ProfileTwoPageState();
}

class _ProfileTwoPageState extends State<ProfileTwoPage> {
  var deviceSize;

  static _showModalSheets(context) {
    CommonBottomSheet(
        context: context,
        // height: ,
        child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new ListTile(
                  onTap: () {},
                  leading: new Icon(
                    FeatherIcons.edit3,
                  ),
                  title: new Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new ListTile(
                  leading: new Icon(
                    FeatherIcons.users,
                  ),
                  title: new Text(
                    "Follower",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new ListTile(
                  leading: new Icon(
                    FeatherIcons.heart,
                  ),
                  title: new Text(
                    "Likes",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      new Container(
                        width: 25.0,
                        child: new Icon(
                          Icons.arrow_drop_down_circle,
                          size: 5.0,
                        ),
                      ),
                      //new Icon(
                      //Icons.,
                      //),
                      new Text(
                        "Terms of service",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(canvasColor: Colors.transparent),
      child: new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          //title: new Text("Design Inspiration"),
          actions: <Widget>[
            new IconButton(
              icon: Icon(FeatherIcons.more_vertical),
              color: Colors.blueAccent,
              onPressed: () => _showModalSheets(context),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: new Stack(
          children: [
            new Container(
              child: new Transform.translate(
                offset: new Offset(0.0, -56.0),
                child: new ClipPath(
                  clipper: new MyClipper(),
                  child: new Stack(
                    children: [
                      new Image.asset(
                        "assets/images/Map.png",
                        fit: BoxFit.cover,
                      ),
                      new Opacity(
                        opacity: 0.5,
                        child: new Container(color: Colors.white),
                      ),
                      new Transform.translate(
                        offset: Offset(0.0, 80.0),
                        child: Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new CircleAvatar(
                                radius: 45.0,
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://avatars2.githubusercontent.com/u/3234592?s=460&v=4"),
                                    ),
                                  ),
                                ),
                              ),
                              title: new Text(
                                "កាំង យីម៉ាន់",
                                style: new TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: new Text(
                                "គ្រូ គណិត",
                                style: new TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Container(
                              // width: 300.0,
                              margin: EdgeInsets.only(top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ProfileTile(
                                    title: "15",
                                    subtitle: "Likes",
                                    textColor: Colors.blueAccent,
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 1.0,
                                    color: Colors.blueAccent,
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                  ),
                                  ProfileTile(
                                    title: "50",
                                    subtitle: "Followers",
                                    textColor: Colors.blueAccent,
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 1.0,
                                    color: Colors.blueAccent,
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                  ),
                                  ProfileTile(
                                    title: "10",
                                    subtitle: "Posts",
                                    textColor: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Positioned(
              top: 200.0,
              left: 320.0,
              child: new FloatingActionButton(
                onPressed: () => {},
                backgroundColor: Colors.blueAccent,
                child: new Icon(Icons.add),
              ),
            ),
            new Transform.translate(
              offset: Offset(0.0, 220.0),
              child: new Row(
                children: <Widget>[],
              ),
            ),
            new Container(
                child: new Column(children: <Widget>[
              new Container(height: 200.0),
              new Expanded(
                  child: new Column(children: <Widget>[
                new ListTile(
                  title: new Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: new Text(
                      "My Posts",
                      style: new TextStyle(fontSize: 30.0),
                    ),
                  ),
                  subtitle: new Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: new Text(
                      "10 Posts",
                      style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ),
                ),
                new Flexible(
                    child: Stack(children: <Widget>[
                  /// Item card
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox.fromSize(
                        size: Size.fromHeight(150.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            /// Item description inside a material
                            Container(
                              margin: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Colors.black38,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () => widget.changeScreen(
                                      screen: ScreenHelper.postDetail),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ListTile(
                                          leading: new CircleAvatar(
                                            radius: 35.0,
                                            child: new Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "https://avatars2.githubusercontent.com/u/3234592?s=460&v=4"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: new Text(
                                            "គណិតវិទ្យា",
                                            style: new TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: new Text(
                                            "តម្លៃ" + "16\$",
                                            style: new TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),

                                        /// Name and Price
                                        // Column(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: <Widget>[
                                        //     Text('គណិតវិទ្យា',
                                        //         style: TextStyle(
                                        //             color: CommonColors.primary,
                                        //             fontWeight: FontWeight.w700,
                                        //             fontSize: 28.0)),
                                        //     Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: <Widget>[
                                        //         Text('តម្លៃ:',
                                        //             style: TextStyle(
                                        //               color: Colors.black,
                                        //             )),
                                        //         Text('16' + '\$',
                                        //             style: TextStyle(
                                        //               color: Colors.black,
                                        //               fontWeight:
                                        //                   FontWeight.w700,
                                        //             )),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),

                                        /// Infos
                                        Container(
                                          margin: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('ថ្នាក់ទី:',
                                                  style: TextStyle()),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Text('12',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                              Text('ម៉ោង:', style: TextStyle()),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Text('1:00 - 2:00',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('ទីកន្លែង:',
                                                  style: TextStyle()),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Text(
                                                    'Monivong High School',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // /// Item image
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Container(
                            //     margin: EdgeInsets.only(right: 20.0),
                            //     decoration: BoxDecoration(
                            //       borderRadius: new BorderRadius.all(
                            //           new Radius.circular(50.0)),
                            //       border: new Border.all(
                            //         color: CommonColors.primary,
                            //         width: 3.0,
                            //       ),
                            //     ),
                            //     child: CircleAvatar(
                            //       backgroundImage: NetworkImage(
                            //           "https://lh4.googleusercontent.com/-pxQQZHW89b8/AAAAAAAAAAI/AAAAAAAAABk/WiqR17OEq9o/photo.jpg?sz=328"),
                            //       foregroundColor: CommonColors.primary,
                            //       radius: 45.0,
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                  ),
                ]))
              ])),
            ])),
          ],
        ),
      ),
    );
  }

  Widget profileOption() {
    return Center();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, 300.0);
    p.lineTo(0.0, 200.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
