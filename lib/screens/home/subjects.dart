//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/utils/index.dart';
import 'package:find_tutors/drawer.dart';
import 'package:find_tutors/model/subject.dart';

class SubjectListPage extends StatefulWidget {
  final List<String> screens;
  final Function changeScreen;
  SubjectListPage({this.screens, this.changeScreen});

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  Future<bool> _onBackPressed() async {
    if (widget.screens.length == 1) {
      return true;
    }
    widget.changeScreen(pop: true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      // buildAppBar(),
      child: ChangeScreen(
          screen: widget.screens[widget.screens.length - 1],
          changeScreen: widget.changeScreen),
    );
  }

  Widget buildAppBar() {
    Widget leading;
    if (widget.screens.length > 1) {
      leading = IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => widget.changeScreen(pop: true),
      );
    }
    return AppBar(
      title: Text(
        widget.screens[widget.screens.length - 1],
        style: TextStyle(color: Color(0xFF6c5ce7)),
      ),
      leading: leading,
      backgroundColor: Colors.white,
    );
  }
}

class SubjectListPageWidget extends StatefulWidget {
  final Function changeScreen;
  const SubjectListPageWidget({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  SubjectListPageWidgetState createState() {
    return new SubjectListPageWidgetState();
  }
}

class SubjectListPageWidgetState extends State<SubjectListPageWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController animationController;
  Animation animation;
  @override
  initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
    // fetchSubject("{}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

    _scrollController.dispose();
    super.dispose();
  }

// List<Subject> _subjects = [];
  List<Subject> _subjects = List.generate(
    25,
    (i) => Subject(id: '${i + 1}', khName: 'yiman', enName: 'posts'),
  );
  Future fetchSubject(String params) {
    String url = 'http://192.168.43.3:3000/find-subject/${params}';
    var httpClient = http.Client();
    return httpClient.get(url).then((response) {
      var result = json.decode(response.body);

      result.map((o) => _subjects.add(Subject.fromMap(o))).toList();
      setState(() {
        _subjects;
      });
    });
  }

  ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  @override
  Widget build(BuildContext context) {
    print(animation.value);
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(),
      drawer: new CustomDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 160.0,
                backgroundColor: Colors.white,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Subject",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  // background: Image.network(
                  //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  //   fit: BoxFit.cover,
                  // )
                ),
                leading: IconButton(
                  icon: Icon(
                    FeatherIcons.align_left,
                    color: CommonColors.primary,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ];
          },
          body: PageReveal(
            revealPercent: animation.value,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
              ),
              itemCount: _subjects.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                final Subject subject = _subjects[index];
                return _listItem(subject, index);
              },
              // controller: _scrollController,
            ),
          )
          // isPerformingRequest ? _buildProgressIndicator() : Container()
          ),
    );
    // return PageReveal(
    //   revealPercent: animation.value,
    //   child: Container(
    //       color: Colors.white10,
    //       // height: 500.0,
    //       child: Column(
    //         children: <Widget>[
    //           CommonAppBar(
    //             title: 'Subject',
    //             onPress: () => Scaffold.of(context).openDrawer(),
    //           ),
    //           Expanded(
    //             child: GridView.builder(
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2,
    //                 // mainAxisSpacing: 10.0,
    //                 crossAxisSpacing: 0.0,
    //                 // childAspectRatio: 1.0,
    //               ),
    //               itemCount: _subjects.length,
    //               padding: const EdgeInsets.only(bottom: 30.0),
    //               itemBuilder: (context, index) {
    //                 final Subject subject = _subjects[index];
    //                 return _listItem(subject, index);
    //               },
    //               controller: _scrollController,
    //             ),
    //           ),
    //           isPerformingRequest ? _buildProgressIndicator() : Container()
    //         ],
    //       )),
    // );
  }

  Widget _listItem(Subject item, int i) {
    double width = MediaQuery.of(context).size.width;
    // return new InkWell(
    //   splashColor: Colors.orange,
    //   child: new Card(
    //       margin: new EdgeInsets.all(10.0),
    //       elevation: 2.0,
    //       // alignment: Alignment.topCenter,
    //       // margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
    //       child: new Column(
    //         // mainAxisAlignment: MainAxisAlignment.end,
    //         children: <Widget>[
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Align(
    //                 alignment: Alignment.topRight,
    //                 // mainAxisAlignment: MainAxisAlignment.end,
    //                 child: Container(
    //                   child: IconButton(
    //                     icon: Icon(
    //                       FeatherIcons.star,
    //                       color: Colors.grey,
    //                       // size: 24.0,
    //                     ),
    //                     onPressed: () {},
    //                     alignment: Alignment.topRight,
    //                     iconSize: 20.0,
    //                   ),
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.topCenter,
    //                 child: Container(
    //                   child: Image.asset(
    //                     "assets/images/sub_icon.png",
    //                     height: 80.0,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 10.0,
    //               ),
    //               Text(
    //                 item.khName.toString(),
    //                 style: TextStyle(fontSize: 24.0),
    //               ),
    //               Text(item.id.toString() + ' ' + item.enName.toString())
    //             ],
    //           ),
    //         ],
    //       )),
    //   onTap: () => widget.changeScreen(screen: ScreenHelper.postList),
    // );
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Stack(
        children: <Widget>[
          /// Item card
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
                size: Size.fromHeight(195.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    /// Item description inside a material
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.black38,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => widget.changeScreen(
                              screen: ScreenHelper.postList),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    child: Image.asset(
                                      "assets/images/sub_icon.png",
                                      height: 100.0,
                                    ),
                                  ),
                                ),

                                /// Name and Price
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(item.khName.toString(),
                                        style: TextStyle(
                                            color: CommonColors.primary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28.0)),
                                    Text(item.id.toString() +
                                        ' ' +
                                        item.enName.toString())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Item Icon
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          icon: Icon(
                            FeatherIcons.star,
                            color: Colors.grey,
                            // size: 24.0,
                          ),
                          onPressed: () {},
                          alignment: Alignment.topRight,
                          iconSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(
            strokeWidth: 4.3,
          ),
        ),
      ),
    );
  }

  _loadMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<Subject> newEntries = await fakeRequest();

      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }

      setState(() {
        _subjects.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Future<List<Subject>> fakeRequest() async {
    return Future.delayed(Duration(seconds: 1), () {
      // return [
      //   SubjectItem(id: "0099", khName: "veasna", enName: "male"),
      //   SubjectItem(id: "0100", khName: "veasna1", enName: "male1"),
      //   SubjectItem(id: "0101", khName: "veasna12", enName: "male12"),
      // ];
      return [];
    });
  }
}
