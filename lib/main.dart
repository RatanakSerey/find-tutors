import 'package:find_tutors/app_state_container.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  MaterialPageRoute.debugEnableFadingRoutes = true;

  // runApp(new App());
  runApp(new AppStateContainer(
    child: new AppRootWidget(),
  ));
}
