import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/ui/pages/students/subjects_detail.dart';

class TutorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: Text('Tutors'),
          leading: new CupertinoButton(
            child: const Text('Back'),
            // icon: Icon(Icons.arrow_back_ios),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          trailing: new IconButton(
            // child: const Text('Back'),
            icon: Icon(Icons.more_vert),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          
        ),
        child: Center(
          child: RaisedButton(
            onPressed: () => 
            // Navigator.pushNamed(context, '/Profile'
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubjectsDetail()),
                  ),
            child: new Text("Go To Subjects Detail"),
          ),
        ));
  }
}
