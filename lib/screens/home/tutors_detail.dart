//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/tools/arc_clipper.dart';
import 'package:find_tutors/widgets/common_divider.dart';
import 'package:find_tutors/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/utils/icon_font.dart';

class TutorsDetailPage extends StatefulWidget {
  // final Function changeScreen;
  // TutorsDetail({this.changeScreen});
  @override
  TutorsDetailPageState createState() {
    return new TutorsDetailPageState();
  }
}

const kExpandedHeight = 100.0;

class TutorsDetailPageState extends State<TutorsDetailPage>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  Widget followColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "15",
              subtitle: "Likes",
              textColor: CommonColors.primary,
            ),
            Container(
              height: 30.0,
              width: 1.0,
              color: CommonColors.primary,
              // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            ProfileTile(
              title: "50",
              subtitle: "Followers",
              textColor: CommonColors.primary,
            ),
            Container(
              height: 30.0,
              width: 1.0,
              color: CommonColors.primary,
              // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            ProfileTile(
              title: "10",
              subtitle: "Posts",
              textColor: CommonColors.primary,
            ),
          ],
        ),
      );

  Widget followColumn1(Size deviceSize) => Container(
        // height: deviceSize.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ProfileTile(
              title: "15",
              subtitle: "Likes",
              textColor: Colors.white,
            ),
            ProfileTile(
              title: "50",
              subtitle: "Followers",
              textColor: Colors.white,
            ),
            Container(
              height: 30.0,
              width: 1.0,
              color: Colors.white30,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            ProfileTile(
              title: "10",
              subtitle: "Posts",
              textColor: Colors.white,
            ),
          ],
        ),
      );

  Widget contactColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: CommonColors.primary,
                  child: IconButton(
                    icon: Icon(FeatherIcons.phone),
                    iconSize: 18.0,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  // radius: 10.0,
                ),
                Text('Call')
              ],
            ),
            CommonDivider(),
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: CommonColors.primary,
                  child: IconButton(
                    icon: Icon(FeatherIcons.message_square),
                    iconSize: 18.0,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  // radius: 10.0,
                ),
                Text('Mesasge')
              ],
            ),
          ],
        ),
      );

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

  Widget profileColumn(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return new Container(
        // flex: 3,
        height: 300.0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Back Icon
                      IconButton(
                        icon: Icon(FeatherIcons.x),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  // Profile
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                "https://lh4.googleusercontent.com/-pxQQZHW89b8/AAAAAAAAAAI/AAAAAAAAABk/WiqR17OEq9o/photo.jpg?sz=328"),
                            foregroundColor: Color(0xFF4E54C8),
                            radius: 45.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ProfileTile(
                          title: "Heng YouSour",
                          subtitle: "Math Teacher",
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              elevation: 1.0,
                              clipBehavior: Clip.antiAlias,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0))),
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  height: 36.0,
                                  width: 120.0,
                                  color: Colors.white,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FeatherIcons.phone,
                                          size: 16.0,
                                          color: CommonColors.primary,
                                        ),
                                        SizedBox(
                                          width: 6.0,
                                        ),
                                        Text(
                                          'Call',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: CommonColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Material(
                              elevation: 1.0,
                              clipBehavior: Clip.antiAlias,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0))),
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  height: 36.0,
                                  width: 120.0,
                                  color: Colors.white,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FeatherIcons.user_plus,
                                          size: 16.0,
                                          color: CommonColors.primary,
                                        ),
                                        SizedBox(
                                          width: 6.0,
                                        ),
                                        Text(
                                          'Folow',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: CommonColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Widget profileColumn1(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return new Container(
        // flex: 3,
        height: 310.0,
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
                  // Back Icon
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                  // Profile

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: deviceSize.width / 3,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
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
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              // ProfileTile(
                              //   title: "Heng YouSour",
                              //   subtitle: "Math Teacher",
                              //   textColor: Colors.white,
                              // ),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                            ],
                          ),
                        ),
                        Container(
                            width: deviceSize.width - deviceSize.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                followColumn1(deviceSize),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Material(
                                      elevation: 1.0,
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Ink(
                                          height: 25.0,
                                          width: deviceSize.width -
                                              deviceSize.width / 2.5 -
                                              20.0,
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                              'Follow',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: CommonColors.primary,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   child: IconButton(
                        //     icon: Icon(FeatherIcons.phone),
                        //     iconSize: 18.0,
                        //     color: CommonColors.primary,
                        //     onPressed: () {},
                        //   ),
                        //   // radius: 10.0,
                        // ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ProfileTile(
                          title: "Heng YouSour",
                          subtitle: "Math Teacher",
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        // CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   child: IconButton(
                        //     icon: Icon(FeatherIcons.message_square),
                        //     iconSize: 18.0,
                        //     color: CommonColors.primary,
                        //     onPressed: () {},
                        //   ),
                        //   // radius: 10.0,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(FeatherIcons.phone),
                          iconSize: 18.0,
                          color: CommonColors.primary,
                          onPressed: () {},
                        ),
                        // radius: 10.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(FeatherIcons.message_square),
                          iconSize: 18.0,
                          color: CommonColors.primary,
                          onPressed: () {},
                        ),
                        // radius: 10.0,
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }

  TabController _controller;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return new Scaffold(
        body: Column(
      children: <Widget>[
        profileColumn(context),
        followColumn(deviceSize),
        // CommonDivider(),
        tabBar(context),
        // tabBar(context)
      ],
    ));
  }

  // TabBar
  Widget tabBar(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        new Container(
          child: new TabBar(
            controller: _controller,
            labelColor: CommonColors.primary,
            indicatorColor: CommonColors.primary,
            unselectedLabelColor: Colors.black54,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            indicatorPadding: EdgeInsets.only(left: 15.0, right: 15.0),
            tabs: [
              new Tab(
                text: 'ABOUT',
              ),
              new Tab(
                text: 'EXPERIENCE',
              ),
              new Tab(
                text: 'POSTS',
              ),
            ],
          ),
        ),
        new Container(
          height: deviceSize.height - (300.0 + 128.0),
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              aboutTab(context),
              historyTab(context),
              postTab(context),
            ],
          ),
        ),
      ],
    );
  }

  // About Tab
  Widget aboutTab(BuildContext context) {
    return new SingleChildScrollView(
        child: Column(children: <Widget>[
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
      new ListTile(leading: const Icon(Icons.home), title: new Text('Name:')),
    ]));
  }

  // History Tab
  Widget historyTab(BuildContext context) => new Card(
        child: new ListTile(
          leading: const Icon(Icons.location_on),
          title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
          trailing: new IconButton(
              icon: const Icon(Icons.my_location), onPressed: () {}),
        ),
      );
  // Post Tab
  Widget postTab(BuildContext context) => new Card(
        child: new ListTile(
          leading: const Icon(Icons.location_on),
          title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
          trailing: new IconButton(
              icon: const Icon(Icons.my_location), onPressed: () {}),
        ),
      );

  Widget _buildActions() {
    Widget profile = new GestureDetector(
      onTap: () {},
      child: new Container(
        height: 30.0,
        width: 45.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: new DecorationImage(
            image: new ExactAssetImage("assets/images/app-icon.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
      ),
    );

    double scale;
    if (scrollController.hasClients) {
      scale = scrollController.offset / 300;
      scale = scale * 2;
      if (scale > 1) {
        scale = 1.0;
      }
    } else {
      scale = 0.0;
    }

    return new Transform(
      transform: new Matrix4.identity()..scale(scale, scale),
      alignment: Alignment.center,
      child: profile,
    );
  }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController = new ScrollController();
  //   scrollController.addListener(() => setState(() {}));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   var flexibleSpaceWidget = new SliverAppBar(
  //     expandedHeight: 250.0,
  //     pinned: true,
  //     flexibleSpace: FlexibleSpaceBar(
  //         centerTitle: true,
  //         title: Text("Developer Libs",
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 16.0,
  //             )),
  //         background: profileColumn(context)),
  //     actions: <Widget>[
  //       new Container(
  //         padding: EdgeInsets.all(5.0),
  //         child: _buildActions(),
  //       ),
  //     ],
  //   );

  //   return Scaffold(
  //     body: new DefaultTabController(
  //       length: 3,
  //       child: NestedScrollView(
  //         controller: scrollController,
  //         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //           return <Widget>[
  //             flexibleSpaceWidget,
  //             SliverPersistentHeader(
  //               delegate: _SliverAppBarDelegate(
  //                 TabBar(
  //                   labelColor: Colors.black87,
  //                   unselectedLabelColor: Colors.black26,
  //                   tabs: [
  //                     Tab(
  //                       icon: Icon(Icons.account_box),
  //                       text: "Detail",
  //                     ),
  //                     Tab(icon: Icon(Icons.add_location), text: "Address"),
  //                     Tab(icon: Icon(Icons.monetization_on), text: "Earning"),
  //                   ],
  //                 ),
  //               ),
  //               pinned: true,
  //             ),
  //           ];
  //         },
  //         body: new TabBarView(
  //           children: <Widget>[
  //             new Text("Detail"),
  //             new Text("Address"),
  //             new Text("Earning"),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
