//packages
import 'package:find_tutors/app_state_container.dart';
import 'package:find_tutors/screens/auth/signin.dart';
import 'package:find_tutors/screens/home/subjects.dart';
import 'package:find_tutors/screens/map/map.dart';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/drawer.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/widgets/gradient_button.dart';

/* navigation icon view */
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    @required String key,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _key = key,
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
  final String _key;
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

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with TickerProviderStateMixin {
  BuildContext _context;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  int _tab = 0;
  final String homeKey = "home";
  final String mapKey = "map";
  final String profileKey = "profile";

  final String initialHome = ScreenHelper.subjectList;
  List<String> homeScreens = [ScreenHelper.subjectList];

  final String initialProfile = ScreenHelper.signin;
  List<String> profileScreens = [ScreenHelper.signin];

  List<NavigationIconView> __navigationViews() {
    _navigationViews = [
      NavigationIconView(
        key: homeKey,
        activeIcon: Icon(FeatherIcons.home),
        icon: Icon(FeatherIcons.home),
        title: translate.text("home"),
        color: Colors.deepPurple,
        vsync: this,
      ),
      NavigationIconView(
        key: profileKey,
        activeIcon: Icon(FeatherIcons.users),
        icon: Icon(FeatherIcons.user),
        title: translate.text("profile"),
        color: Colors.indigo,
        vsync: this,
      ),
      NavigationIconView(
        key: mapKey,
        activeIcon: Icon(FeatherIcons.map_pin),
        icon: Icon(FeatherIcons.map),
        title: translate.text("map"),
        color: Colors.teal,
        vsync: this,
      ),
    ];
    return _navigationViews;
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = __navigationViews();

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

  void onNavigationIconViewTab(int index, String key) {
    final stateContainer = AppStateContainer.of(_context);
    if (stateContainer.currentUser == null) {
      if (key == profileKey) {
        CommonBottomSheet(
          context: _context,
          child: Center(
            child: signInBottomSheet(),
          ),
        ).show();
      } else {
        setState(() {
          _navigationViews[_tab].controller.reverse();
          _tab = index;
          _navigationViews[_tab].controller.forward();
        });
      }
    } else {
      if (index == _tab) {
        if (key == homeKey) {
          setState(() {
            homeScreens = [initialHome];
          });
        }
      }
      setState(() {
        _navigationViews[_tab].controller.reverse();
        _tab = index;
        _navigationViews[_tab].controller.forward();
      });
    }
  }

  BottomNavigationBar botNavBar() {
    return BottomNavigationBar(
      items: __navigationViews()
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _tab,
      type: _type,
      onTap: (int index) =>
          onNavigationIconViewTab(index, _navigationViews[index]._key),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final stateContainer = AppStateContainer.of(context);
    return Scaffold(
      key: stateContainer.scaffoldKey,
      appBar: buildAppBar(),
      drawer: CustomDrawer(onTabMenuTap: onNavigationIconViewTab),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _tab != 0,
            child: SubjectListWidget(
                screens: homeScreens, changeScreen: changeScreen),
          ),
          Offstage(
            offstage: _tab != 1,
            child: SubjectListWidget(
                screens: profileScreens, changeScreen: changeScreen),
          ),
          Offstage(
            offstage: _tab != 2,
            child: MapPage(),
          ),
        ],
      ),
      bottomNavigationBar: botNavBar(),
    );
  }

  void changeScreen({String screen, bool pop = false}) {
    if (!pop) {
      homeScreens.add(screen);
    } else {
      homeScreens.removeLast();
    }
    setState(() {
      homeScreens = homeScreens;
    });
  }

  Widget buildAppBar() {
    return null;
  }

  Widget signInBottomSheet() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(FeatherIcons.x),
              onPressed: () => Navigator.pop(context),
              iconSize: 14.0,
            ),
          ],
        ),
        Text(
          'You need an account to continue',
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            width: double.infinity,
            child: GradientButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signin);
              },
              text: 'Sign In',
            )),
        Text(
          'OR',
          style: new TextStyle(
              color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            width: double.infinity,
            child: GradientButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signup);
              },
              text: 'Sign Up',
            )),
      ],
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
//
//
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
