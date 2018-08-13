import 'package:flutter/material.dart';

import 'package:find_tutors/ui/widgets/common_divider.dart';
import 'package:find_tutors/ui/widgets/common_scaffold.dart';
import 'package:find_tutors/ui/widgets/profile_tile.dart';
import 'package:find_tutors/ui/widgets/custom_background.dart';

import 'package:find_tutors/home.dart';
class AboutUs extends StatelessWidget {
  var deviceSize;

  // Profile Column
  Widget profileColumn() => Container(
        height: deviceSize.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("hi");
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(50.0)),
                    border: new Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://68.media.tumblr.com/f7e2e01128ca8eb2b9436aa3eb2a0a33/tumblr_ogwlnpSpcU1sikc68o1_1280.png"),
                    foregroundColor: Colors.black,
                    radius: 40.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            ProfileTile(
              title: "Heng Yousour",
              subtitle: "App Developer",
              textColor: Colors.white,
            ),
          ],
        ),
      );
  // Follow Column
  Widget followColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "25",
              subtitle: "Followers",
            ),
            ProfileTile(
              title: "15",
              subtitle: "Posts",
            ),
            ProfileTile(
              title: "10",
              subtitle: "Comments",
            ),
          ],
        ),
      );
  // Post Column
  Widget postCard() => Container(
        width: double.infinity,
        height: deviceSize.height / 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Post",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // profileColumn(),
          // followColumn(deviceSize),
          // CommonDivider(),
          // postCard()
        ],
      ),
    );
  }

  Widget _scaffold() => CommonScaffold(
        // appTitle: "View Profile",
        bodyData: Home(),

        // showFAB: true,
        // floatingIcon: Icons.add,
        // showDrawer: true,
        showBottomNav: true,
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
