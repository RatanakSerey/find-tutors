# find-tutors
> folders and files structure
- **android/**
- **ios/**
- **assets/**
    - fonts/
    - images/
- **lib/**
    - data/
        - index.dart
    - model/
        - index.dart
    - screens/
        - index.dart
        - auth/
            - signin.dart `[Signin, SigninWidget]`
        - students/
        - tutors/
        - subject/
            - subject_list.dart ` [SubjectList, SubjectListWidget]`
    - services/
        - index.dart
    - utils/
        - index.dart
        - animations/
        - tools/
        - constants.dart
        - modal_sheet.dart
        - alert_dialog.dart
    - widgets
        - index.dart
        - common_appbar.dart
        - common_divider.dart
        - common_button.dart

> easy import packages
> 
<code>
//packages<br>
import 'package:flutter/material.dart';<br>
import 'package:flutter/cupertino.dart';
<br>
//widgets<br>
import 'package:find_tutors/widgets/index.dart';<br>
//utils<br>
import 'package:find_tutors/utils/index.dart';
</code>