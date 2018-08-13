// Show Subjects on home page
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:find_tutors/ui/widgets/colors.dart';

import 'package:find_tutors/model/product.dart';
import 'package:find_tutors/model/data.dart';
import '../../../app.dart';
import 'package:find_tutors/ui/widgets/common_drawer.dart';

class SubjectList extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Subject> subjects = getSubjects(Category.all);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return subjects.map((subject) {
      return Card(
        child: new Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))
                // border: new Border(
                //     bottom:
                //         new BorderSide(color: Theme.of(context).dividerColor))
                        ),
            child: new Row(children: <Widget>[
              new Container(
                width: 70.0,
                margin: const EdgeInsets.only(right: 15.0),
                child: new Image.asset("assets/diamond.png", width: 20.0),
              ),
              new Expanded(
                  flex: 4,
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: new Container(
                                  child: new Text(
                                subject.name,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.title,
                              )),
                            ),
                            new RaisedButton(
                              child: new Text(
                                '1',
                                style: new TextStyle(fontSize: 11.0),
                              ),
                              onPressed: () {},
                              elevation: 0.0,
                              color: kShrineExodus,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(50.0)),
                            ),
                          ],
                        ),
                      ],
                      textBaseline:
                          DefaultTextStyle.of(context).style.textBaseline)),
              new Expanded(
                  // flex: 1,
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Icon(
                    Icons.arrow_forward_ios,
                    color: kShrineExodus,
                  ),
                ],
              )),
            ])),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
            crossAxisCount: 1,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 6.0 / 2.5,
            children: _buildGridCards(context) // Changed code
            ),
      ),
    );
  }
}
