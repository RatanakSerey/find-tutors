//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class MapWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  MapWidget({this.scaffoldKey});
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
