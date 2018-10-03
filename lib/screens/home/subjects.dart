//packages
import 'package:find_tutors/app_state_container.dart';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/utils/animations/page_reveal.dart';
import 'package:find_tutors/utils/change_screen.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/snack_bar.dart';
import 'package:find_tutors/widgets/image_loader.dart';
import 'package:find_tutors/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/models/subject.dart';

class SubjectListWidget extends StatefulWidget {
  final List<String> screens;
  final Function changeScreen;
  SubjectListWidget({this.screens, this.changeScreen});

  @override
  _SubjectListWidgetState createState() => _SubjectListWidgetState();
}

class _SubjectListWidgetState extends State<SubjectListWidget> {
  @override
  void initState() {
    super.initState();
  }

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
      child: ChangeScreen(
          screen: widget.screens[widget.screens.length - 1],
          changeScreen: widget.changeScreen),
    );
  }
}

class SubjectListPage extends StatefulWidget {
  final Function changeScreen;
  const SubjectListPage({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  _SubjectListPageState createState() {
    return new _SubjectListPageState();
  }
}

class _SubjectListPageState extends State<SubjectListPage>
    with SingleTickerProviderStateMixin {
  BuildContext _context;
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  AnimationController animationController;
  Animation animation;
  ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  bool notFound = false;
  List<Subject> _subjects = [];

  Future getSubject(String params) async {
    String url = MethodNames.findSubject + params;
    return http.get(url).then((response) {
      var result = json.decode(response.body);
      _subjects.clear();
      if (result["result"].length != 0) {
        result["result"].map((o) {
          _subjects.add(Subject.fromMap(o));
        }).toList();
        setState(() {
          _subjects = _subjects;
          isLoading = false;
        });
      } else {
        CommonSnackBar(
          context: _context,
          type: "info",
          content: translate.text("noData"),
        ).show();
        setState(() {
          isLoading = false;
        });
      }
    }).catchError((err) {
      print(err);
      CommonSnackBar(
        context: _context,
        type: "danger",
        content: translate.text("serverDisconnect"),
      ).show();
      setState(() {
        isLoading = false;
      });
    });
  }

  refreshSubject() async {
    await getSubject("{}/{}");
  }

  void openDrawer() =>
      AppStateContainer.of(_context).scaffoldKey.currentState.openDrawer();

  void onSubjectTap() {
    widget.changeScreen(screen: ScreenHelper.postList);
  }

  Widget _listItem(Subject item, int i) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Stack(
        children: <Widget>[
          /// Item Grid Card
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
              size: Size.fromHeight(195.0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.black38,
                      color: Colors.white,
                      child: InkWell(
                        onTap: onSubjectTap,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              /// Favorite Icon
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(right: 5.0, top: 3.0),
                                  child: InkWell(
                                    child: Icon(
                                      FeatherIcons.star,
                                      color: Colors.grey,
                                      size: 20.0,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              // Subject Images
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  child: ImageLoader(
                                    height: 80.0,
                                    imageUrl: item.path,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    item.khName.toString(),
                                    style: TextStyle(
                                        color: CommonColors.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
    refreshSubject();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
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
                title: Text(
                  translate.text("subject"),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  FeatherIcons.align_left,
                  color: CommonColors.primary,
                ),
                onPressed: openDrawer,
              ),
            ),
          ];
        },
        body: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Text(translate.text("getResource")),
                  )
                ],
              )
            : RefreshIndicator(
                key: refreshKey,
                onRefresh: () => refreshSubject(),
                child: _subjects.length > 0
                    ? PageReveal(
                        revealPercent: animation.value,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                          ),
                          itemCount: _subjects.length,
                          padding: const EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            final Subject subject = _subjects[index];
                            return _listItem(subject, index);
                          },
                        ),
                      )
                    : ListView(
                        children: <Widget>[NotFoundWidget()],
                      ),
              ),
      ),
    );
  }
}
