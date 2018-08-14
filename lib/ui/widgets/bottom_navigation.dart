import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widget
import 'package:find_tutors/ui/widgets/drawer.dart';
import 'package:find_tutors/ui/widgets/bottom_modal_sheet.dart';

// Page
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';
import 'package:find_tutors/ui/pages/map/map.dart';

// class Navigation extends StatefulWidget {
//   @override
//   NavigationState createState() => new NavigationState();
// }

// class NavigationState extends State<Navigation> {
//   PageController _tabController;

//   String appTitle = "";
//   int _tab = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = new PageController();
//     this.appTitle = NavigationItems[0].title;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   static _showModalSheets(context) {
//     ModalSheet.modalBottomSheetMore(context);
//   }

//   @override
//   Widget build(BuildContext context) => new Scaffold(
//         appBar: appBarBuilder(appTitle),
//         floatingActionButton: new IconButton(
//           icon: Icon(Icons.ac_unit),
//           onPressed: () => _showModalSheets(context),
//         ),
//         drawer: CommonDrawer(),
//         // tabFn: onTap,
//         // ),
//         body: new PageView(
//           controller: _tabController,
//           physics: NeverScrollableScrollPhysics(),
//           onPageChanged: onTabChanged,
//           children: <Widget>[SubjectList(), MapPage(), Signin()],
//         ),

//         //Tabs
//         bottomNavigationBar: new BottomNavigationBar(
//           fixedColor: Color(0xFF4E54C8),
//           currentIndex: _tab,
//           onTap: onTap,
//           items: NavigationItems.map((item) {
//             return new BottomNavigationBarItem(
//               title: new Text(item.title),
//               icon: new Icon(item.icon),
//             );
//           }).toList(),
//         ),
//       );

//   Widget appBarBuilder(String title) {
//     if (title == "Subjects") {
//       return AppBar(
//         title: Text(appTitle),
//         // leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: ()=> _showModalSheets(context),),
//       );
//     } else {
//       return null;
//     }
//     // switch (title) {
//     //   case 'Subjects':
//     //     appBar = null
//     //     break;
//     //   case 1:
//     //     this.appTitle = NavigationItems[1].title;
//     //     break;
//     //   case 2:
//     //     this.appTitle = NavigationItems[2].title;
//     //     break;
//     // }
//   }

//   void onTap(int tab) {
//     _tabController.jumpToPage(tab);
//   }

//   void onTabChanged(int tab) {
//     setState(() {
//       this._tab = tab;
//     });
//     switch (tab) {
//       case 0:
//         this.appTitle = NavigationItems[0].title;
//         break;
//       case 1:
//         this.appTitle = NavigationItems[1].title;
//         break;
//       case 2:
//         this.appTitle = NavigationItems[2].title;
//         break;
//     }
//   }
// }

class NavigationItem {
  const NavigationItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<NavigationItem> NavigationItems = const <NavigationItem>[
  const NavigationItem(title: 'Subjects', icon: Icons.bookmark),
  const NavigationItem(title: 'Map', icon: Icons.navigation),
  const NavigationItem(title: 'Profile', icon: Icons.person_outline),
];

class Navigate extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigate> {
  String appTitle = "";
  Widget appBarBuilder(String title) {
    if (title == "Home") {
      return AppBar(
        title: Text(appTitle),
        // leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: ()=> _showModalSheets(context),),
      );
    } else {
      return null;
    }
    // switch (title) {
    //   case 'Subjects':
    //     appBar = null
    //     break;
    //   case 1:
    //     this.appTitle = NavigationItems[1].title;
    //     break;
    //   case 2:
    //     this.appTitle = NavigationItems[2].title;
    //     break;
    // }
  }

  static _showModalSheets(context) {
    ModalSheet.modalBottomSheetMore(context);
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
      // appBar: appBarBuilder(appTitle),
      appBar: AppBar(
        title: Text('Title'),
        actions: [
          new IconButton(
              icon: new Icon(Icons.notifications_none),
              onPressed: () {})
        ],
      ),
      // floatingActionButton: new IconButton(
      //   icon: Icon(Icons.ac_unit),
      //   onPressed: () => _showModalSheets(context),
      // ),
      drawer: CommonDrawer(),
      body: new CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.white,
          activeColor: Color(0xFF6c5ce7),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Subject'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.navigation,
              ),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              title: Text('Profile'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return SubjectList();
                  break;
                case 1:
                  return MapPage();
                  break;
                case 2:
                  return Signin();
                  break;
                default:
                  return Container();
              }
            },
          );
        },
      ));
}
