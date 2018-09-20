//packages
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';
//screens
import 'package:find_tutors/screens/index.dart';
import 'package:find_tutors/drawer.dart';

import 'package:find_tutors/utils/icon_font.dart';

/* navigation icon view */
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Text(title),
          backgroundColor: color,
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

// class CustomIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final IconThemeData iconTheme = IconTheme.of(context);
//     return Container(
//       margin: const EdgeInsets.all(4.0),
//       width: iconTheme.size - 8.0,
//       height: iconTheme.size - 8.0,
//       color: iconTheme.color,
//     );
//   }
// }

// class CustomInactiveIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final IconThemeData iconTheme = IconTheme.of(context);
//     return Container(
//         margin: const EdgeInsets.all(4.0),
//         width: iconTheme.size - 8.0,
//         height: iconTheme.size - 8.0,
//         decoration: BoxDecoration(
//           border: Border.all(color: iconTheme.color, width: 2.0),
//         ));
//   }
// }

class TabNavigator extends StatefulWidget {
  @override
  State createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  int _tab = 0;
  String appBarTitle = "";
  List<String> subjectListScreens = [ScreenHelper.subjectList];
  List<String> signinScreens = [ScreenHelper.signin];
  final List<String> initialScreens = [ScreenHelper.subjectList];

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        activeIcon: const Icon(Icons.cloud),
        icon: Icon(FeatherIcons.home),
        title: 'Home',
        color: Colors.deepPurple,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.cloud),
        icon: Icon(FeatherIcons.map),
        title: 'Map',
        color: Colors.teal,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.event_available),
        icon: Icon(FeatherIcons.user),
        title: 'Profile',
        color: Colors.indigo,
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_tab].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  // Widget _buildTransitionsStack() {
  //   final List<FadeTransition> transitions = <FadeTransition>[];

  //   for (NavigationIconView view in _navigationViews)
  //     transitions.add(view.transition(_type, context));

  //   // We want to have the newly animating (fading in) views on top.
  //   transitions.sort((FadeTransition a, FadeTransition b) {
  //     final Animation<double> aAnimation = a.opacity;
  //     final Animation<double> bAnimation = b.opacity;
  //     final double aValue = aAnimation.value;
  //     final double bValue = bAnimation.value;
  //     return aValue.compareTo(bValue);
  //   });

  //   return Stack(children: transitions);
  // }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _tab,
      type: _type,
      onTap: (int index) {
        if (index == _tab) {
          setState(() {
            this.subjectListScreens = [initialScreens[index]];
          });
        }
        setState(() {
          _navigationViews[_tab].controller.reverse();
          _tab = index;
          _navigationViews[_tab].controller.forward();
        });
      },
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      drawer: CustomDrawer(),
      body: Stack(children: <Widget>[
        Offstage(
          offstage: _tab != 0,
          child: SubjectListPage(
              mainScaffoldKey: _scaffoldKey,
              screens: subjectListScreens,
              changeScreen: changeScreen),
        ),
        Offstage(
          offstage: _tab != 1,
          child: MapPage(),
        ),
        Offstage(
          offstage: _tab != 2,
          child: SigninPage(screens: signinScreens, changeScreen: changeScreen),
        ),
      ]),
      bottomNavigationBar: botNavBar,
    );
  }

  void changeScreen({String screen, bool pop = false}) {
    if (!pop) {
      this.subjectListScreens.add(screen);
    } else {
      this.subjectListScreens.removeLast();
    }
    setState(() {
      this.subjectListScreens= this.subjectListScreens;
    });
  }

  Widget buildAppBar() {
    return null;
  }
}
