//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/constants.dart';

class PostList extends StatefulWidget {
  final Function changeScreen;
  PostList({this.changeScreen});

  @override
  PostListState createState() {
    return new PostListState();
  }
}

class PostListState extends State<PostList>
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
        title: Text('Posts', style: TextStyle(color: Color(0xFF6c5ce7))),
        backgroundColor: Colors.white,
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 25.0,
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
      return Center(
        child: RaisedButton(
          onPressed: () => widget.changeScreen(screen: ScreenHelper.postDetail),
          child: new Text("Go To Post Detail"),
        ),
      );
    }
    return Center(
        child: new Text(
      tab.text,
      style: new TextStyle(fontSize: 20.0),
    ));
  }
}
