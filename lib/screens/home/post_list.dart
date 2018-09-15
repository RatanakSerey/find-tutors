//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
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
        centerTitle: true,
        title: Text('Subject Name',
            style: TextStyle(
              color: Color(0xFF6c5ce7),
            )),
        backgroundColor: Colors.white,
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
                      margin: EdgeInsets.only(top: 20.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.black38,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => widget.changeScreen(
                              screen: ScreenHelper.postDetail),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /// Name and Price
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ហេង យូស៊ួរ',
                                        style: TextStyle(
                                            color: CommonColors.primary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28.0)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('តម្លៃ:',
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
                                        Text('16' + '\$',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),

                                /// Infos
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ថ្នាក់ទី:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text('12',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Text('ម៉ោង:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text('1:00 - 2:00',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ទីកន្លែង:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text('Monivong High School',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Item image
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(50.0)),
                          border: new Border.all(
                            color: CommonColors.primary,
                            width: 3.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://lh4.googleusercontent.com/-pxQQZHW89b8/AAAAAAAAAAI/AAAAAAAAABk/WiqR17OEq9o/photo.jpg?sz=328"),
                          foregroundColor: CommonColors.primary,
                          radius: 45.0,
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          /// Review
          Padding(
            padding: EdgeInsets.only(top: 160.0, left: 30.0, right: 30.0),
            child: Material(
              elevation: 12.0,
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: CommonColors.kitGradients,
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Ink(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FeatherIcons.heart,
                                size: 16.0,
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                '10 Likes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ]),
                      ),
                      Container(
                        height: 15.0,
                        width: 1.0,
                        color: Colors.white,
                        // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Ink(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FeatherIcons.clock,
                                size: 16.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                '1 Hour',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ]),
                      ),
                      Container(
                        height: 15.0,
                        width: 1.0,
                        color: Colors.white,
                        // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Ink(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FeatherIcons.users,
                                size: 16.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                '10 អ្នក',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
