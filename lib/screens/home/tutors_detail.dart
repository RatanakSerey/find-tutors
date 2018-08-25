//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class TutorsDetailPage extends StatelessWidget {
  // final Function changeScreen;
  // TutorsDetail({this.changeScreen});
  var deviceSize;

  // Profile
  Widget profileColumn() => Container(
        height: deviceSize.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.chat),
                    color: CommonColors.primary,
                    onPressed: () {},
                  ),
                  // radius: 10.0,
                ),
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
                        "https://lh4.googleusercontent.com/-pxQQZHW89b8/AAAAAAAAAAI/AAAAAAAAABk/WiqR17OEq9o/photo.jpg?sz=328"),
                    foregroundColor: Color(0xFF4E54C8),
                    radius: 45.0,
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.call),
                //   color: Colors.white,
                //   onPressed: () {},
                // ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.call),
                    color: CommonColors.primary,
                    onPressed: () {},
                  ),
                  // radius: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            ProfileTile(
              title: "Heng YouSour",
              subtitle: "Math Teacher",
              textColor: Colors.white,
            ),
          ],
        ),
      );

  //  Follow
  Widget followColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ProfileTile(
              title: "15",
              subtitle: "Posts",
            ),
            ProfileTile(
              title: "50",
              subtitle: "Followers",
            ),
            ProfileTile(
              title: "10",
              subtitle: "Likes",
            ),
          ],
        ),
      );

  // Description
  Widget descColumn() => Container(
        height: deviceSize.height * 0.10,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "Google Developer Expert for Flutter. Passionate #Flutter, #Android Developer. #Entrepreneur #YouTuber",
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              maxLines: 3,
              softWrap: true,
            ),
          ),
        ),
      );

  // Account
  Widget accountColumn() => Container(
        height: deviceSize.height * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Website",
                  subtitle: "about.me/imthepk",
                ),
                ProfileTile(
                  title: "Phone",
                  subtitle: "+919876543210",
                ),
                ProfileTile(
                  title: "YouTube",
                  subtitle: "youtube.com/mtechviral",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Location",
                  subtitle: "New Delhi",
                ),
                ProfileTile(
                  title: "Email",
                  subtitle: "mtechviral@gmail.com",
                ),
                ProfileTile(
                  title: "Facebook",
                  subtitle: "fb.com/imthepk",
                ),
              ],
            ),
          ],
        ),
      );

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Flexible(
        flex: 3,
        child: ClipPath(
          clipper: new ArcClipper(),
          child: Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: CommonColors.kitGradients,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.0, 0.5],
                      tileMode: TileMode.clamp),
                ),
              ),
              new SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                  profileColumn(),
                ],
              ))
            ],
          ),
        ));
  }

  Widget bottomHalf(BuildContext context) {
    return Flexible(
      flex: 5,
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            followColumn(deviceSize),
            CommonDivider(),
            descColumn(),
            CommonDivider(),
            accountColumn(),
            CommonDivider(),
            accountColumn(),
            CommonDivider(),
            accountColumn(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return new Scaffold(
        body: Column(
      children: <Widget>[topHalf(context), bottomHalf(context)],
    ));
  }
}
