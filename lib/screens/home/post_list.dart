//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
//widget
import 'package:find_tutors/utils/icon_font.dart';
//utils
import 'package:find_tutors/utils/constants.dart';

class PostListPage extends StatefulWidget {
  final Function changeScreen;
  PostListPage({this.changeScreen});

  @override
  PostListPageState createState() {
    return new PostListPageState();
  }
}

class PostListPageState extends State<PostListPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Featured"),
    new Tab(text: "Popular"),
    new Tab(text: "Latest")
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF6c5ce7), //change your color here
          ),
        centerTitle: true,
        title: Text('ភាសាខ្មែរ',
            style: TextStyle(
              color: Color(0xFF6c5ce7), fontWeight: FontWeight.w600
            )),
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
              icon: Icon(FeatherIcons.search),
              color: Color(0xFF6c5ce7),
              onPressed: () {},
            )
        ],
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 30.0,
            indicatorColor: Color(0xFF6c5ce7),
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          return buildTabBarViewItem(tab);
        }).toList(),
      ),
      // ),
      // Text("Tutors List"),
      // RaisedButton(
      //   onPressed: () =>
      //       widget.changeScreen(screen: ScreenHelper.subjectDetail),
      //   child: new Text("Go To Subject Detail"),
      // ),
      // ],
      // )
    );
  }

  Widget buildTabBarViewItem(tab) {
    if (tab.text == "Featured") {
      return ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('20 Posts'),
                Text('Filter'),
              ],
            ),
          ),
          shopItem(),
          shopItem(),
          shopItem(),
        ],
      );
    }
    return Center(
        child: new Text(
      tab.text,
      style: new TextStyle(fontSize: 20.0),
    ));
  }

  Widget shopItem() {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Stack(
        children: <Widget>[
          /// Item card
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
                size: Size.fromHeight(170.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    /// Item description inside a material
                    Container(
                      // margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.black38,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => widget.changeScreen(
                              screen: ScreenHelper.postDetail),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  leading: new CircleAvatar(
                                    radius: 40.0,
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              "https://avatars2.githubusercontent.com/u/3234592?s=460&v=4"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: new Text(
                                    "កាំង យីម៉ាន់",
                                    style: new TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: new Text(
                                    "តម្លៃ" + "16\$",
                                    style: new TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),

                                /// Name and Price
                                // Column(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.end,
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.start,
                                //   children: <Widget>[
                                //     Text('គណិតវិទ្យា',
                                //         style: TextStyle(
                                //             color: CommonColors.primary,
                                //             fontWeight: FontWeight.w700,
                                //             fontSize: 28.0)),
                                //     Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: <Widget>[
                                //         Text('តម្លៃ:',
                                //             style: TextStyle(
                                //               color: Colors.black,
                                //             )),
                                //         Text('16' + '\$',
                                //             style: TextStyle(
                                //               color: Colors.black,
                                //               fontWeight:
                                //                   FontWeight.w700,
                                //             )),
                                //       ],
                                //     ),
                                //   ],
                                // ),

                                /// Infos
                                Container(
                                  margin: EdgeInsets.only(left: 20.0, top: 10.0 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('ថ្នាក់ទី:', style: TextStyle()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text('12',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Text('ម៉ោង:', style: TextStyle()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text('1:00 - 2:00',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('ទីកន្លែង:', style: TextStyle()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text('Monivong High School',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
