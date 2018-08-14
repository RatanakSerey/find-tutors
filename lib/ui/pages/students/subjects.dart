// Show Subjects on home page
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/ui/pages/students/tutors_list.dart';
import 'package:find_tutors/ui/widgets/drawer.dart';

class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // navigationBar: new CupertinoNavigationBar(
        //   middle: Text('Subjects'),
        //   leading: new CupertinoButton(
        //     child: const Text('Menu'),
        //     // icon: Icon(Icons.arrow_back_ios),
        //     padding: EdgeInsets.zero,
        //     onPressed: () {
        //       // Navigator.of(context).pop(false);
        //       () => CommonDrawer();
        //     },
        //   ),
        // ),

        child: Center(
      child: RaisedButton(
        onPressed: () =>
            // Navigator.pushNamed(context, '/Profile'
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TutorList()),
            ),
        child: new Text("Go To Tutors List"),
      ),
    ));
    // return Scaffold(
    //   body: Center(
    //     child: RaisedButton(
    //       onPressed: () =>
    //           // Navigator.pushNamed(context, '/Profile'
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => TutorList()),
    //           ),
    //       child: new Text("Go To Tutors List"),
    //     ),
    //   ),
    // );
  }
}
