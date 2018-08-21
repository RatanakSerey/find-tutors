import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:find_tutors/ui/widgets/about_tile.dart';
import 'package:find_tutors/ui/widgets/profile_tile.dart';


Widget header(context) => Ink(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: CommonColors.kitGradients)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                title: "Pawan Kumar",
                subtitle: "mtechviral@gmail.com",
                textColor: Colors.white,
              ),
            ),
            new IconButton(
              icon: new Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        // shape: RoundedRectangleBorder(
        //     borderRadius: new BorderRadius.only(
        //         topLeft: new Radius.circular(15.0),
        //         topRight: new Radius.circular(15.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            header(context),
            Expanded(
                child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  new GestureDetector(
                    child: new Text(
                      "Home",
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      print("Hello world");
                    },
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: Color(0xFFFFFFFF),
                  ),
                  SizedBox(height: 20.0),
                  new GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Signin()),
                      // );
                    },
                    child: new Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: Color(0xFFFFFFFF),
                  ),
                  SizedBox(height: 20.0),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, 'otherPage');
                    },
                    child: new Text(
                      "Setting",
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: Color(0xFFFFFFFF),
                  ),
                  SizedBox(height: 20.0),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/Tutor Profile");
                    },
                    child: new Text(
                      "About",
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ])),
            MyAboutTile()
          ],
        ));
  }
}
