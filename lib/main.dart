import 'package:find_tutors/app_state_container.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  runApp(
    new AppStateContainer(
      child: new AppRootWidget(),
    ),
  );
}
