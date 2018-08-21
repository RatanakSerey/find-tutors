import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
// Page
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/map/map.dart';
import 'package:find_tutors/ui/pages/home/subjects.dart';
// Widget
import 'package:find_tutors/ui/widgets/navigation/drawer.dart';

class TabItem {
  final Widget title;
  final Icon icon;
  TabItem({this.title, this.icon});
}

final List tabItems = [
  TabItem(title: Text('Home'), icon: Icon(Icons.home)),
  TabItem(title: Text('Map'), icon: Icon(Icons.map)),
  TabItem(title: Text('Profile'), icon: Icon(Icons.person_outline)),
];

class TabNavigator extends StatefulWidget {
  @override
  State createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  int _tab = 0;
  String appBarTitle = "";
  List<String> subjectListScreens = [ScreenHelper.subjectList];
  List<String> signinScreens = [ScreenHelper.signin];
  final List<String> initialScreens = [ScreenHelper.subjectList];

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: Stack(children: <Widget>[
        Offstage(
          offstage: _tab != 0,
          child: SubjectListPage(
              screens: subjectListScreens, changeScreen: changeScreen),
        ),
        Offstage(
          offstage: _tab != 1,
          child: MapPage(scaffoldKey: _scaffoldKey),
        ),
        Offstage(
          offstage: _tab != 2,
          child: Signin(screens: signinScreens, changeScreen: changeScreen),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: tabItems.map((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            title: item.title,
          );
        }).toList(),
      ),
    );
  }

  void onTap(int index) {
    if (index == _tab) {
      setState(() {
        this.subjectListScreens = [initialScreens[index]];
      });
    }
    setState(() {
      _tab = index;
    });
  }

  void changeScreen({String screen, bool pop = false}) {
    if (!pop) {
      this.subjectListScreens.add(screen);
    } else {
      this.subjectListScreens.removeLast();
    }
    setState(() {
      this.subjectListScreens;
    });
  }

  Widget buildDrawer() {
    return CustomDrawer();
  }

  Widget buildAppBar() {
    // if (_page != 0) {
    return null;
    // }
    // return AppBar(
    //   title: Text(appBarTitle),
    //   leading: IconButton(
    //     icon: Icon(Icons.memory),
    //     onPressed: ()=> _scaffoldKey.currentState.openDrawer()
      
    // );
  }
}