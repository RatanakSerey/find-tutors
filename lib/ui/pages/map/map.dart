import 'package:find_tutors/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  MapPage({this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CommonAppBar(onPress: scaffoldKey.currentState.openDrawer,),
        ],
      ),
    );
  }
}
