//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class ModalSheet {
  static modalBottomSheetMore(context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0))),
            child: Container(
              height: 300.0,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                        new ListTile(
                          title: const Text(
                            'Sort By',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        new ListTile(
                          leading: new Container(
                            width: 4.0,
                          ),
                          title: const Text(
                            'My Order',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: new Icon(Icons.check),
                        ),
                        new ListTile(
                          leading: new Container(
                            width: 4.0,
                          ),
                          title: const Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: new Icon(Icons.check),
                        ),
                        new Divider(
                          height: 10.0,
                        ),
                        new ListTile(
                          title: const Text(
                            'Delete all completed tasks',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () async {},
                        ),
                       
                      ])), new Divider(
                  height: 4.0,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      new Container(
                        width: 25.0,
                        child: new Icon(
                          Icons.arrow_drop_down_circle,
                          size: 5.0,
                        ),
                      ),
                      //new Icon(
                      //Icons.,
                      //),
                      new Text(
                        "Terms of service",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ));
      },
    );
  }
  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: CommonColors.kitGradients)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                // backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Heng YouSour",
                  subtitle: "sourkh@gmail.com",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
}
