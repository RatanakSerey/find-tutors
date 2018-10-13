//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:find_tutors/widgets/image_loader.dart';
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
  final List<Widget> tabs = [
    new CustomTab(text: "ពិសេស", ref: "featured",),
    new CustomTab(text: "ពេញនិយម", ref: "popular",),
    new CustomTab(text: "ថ្មីបំផុត", ref: "latest",),
  ];
  final List _fakeData = [
    new FakeData(
        name: "រតនា",
        location: "វិទ្យាល័យព្រះមុនីវង្ស",
        time: "១:០០ - ២:០០ រសៀល",
        price: "1000៛/ម៉ោង",
        level: "១២",
        photo: "https://piktochart.com/wp-content/authors/Wilson-113.jpg"),
    new FakeData(
        name: "​បញ្ញា",
        location: "អនុវិទ្យាល័យសោហឺ",
        time: "១២:០០ - ១:០០ ថ្ងៃត្រង់",
        price: "1000៛/ម៉ោង",
        level: "៨",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzMb9osmdi4jPSZBZ3c9YksapZtbYrTuBGbXMoYDXn7btVuMFQ"),
    new FakeData(
        name: "សុវណ្ណ",
        location: "វិទ្យាល័យនេតយ៉ង់",
        time: "៥:០០ - ៦:០០ ល្ងាច",
        price: "1000៛/ម៉ោង",
        level: "១០",
        photo: "https://catalin.me/wp-content/uploads/2018/07/avatar_new.jpg"),
  ];
  TabController _tabController;
  ScrollController _scrollController = ScrollController();

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
        leading: IconButton(
          icon: Icon(FeatherIcons.arrow_left),
          color: Color(0xFF6c5ce7),
          onPressed: () {},
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF6c5ce7), //change your color here
        ),
        centerTitle: true,
        title: Text(
          'ភាសាខ្មែរ',
          style:
              TextStyle(color: Color(0xFF6c5ce7), fontWeight: FontWeight.w600),
        ),
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
        children: tabs.map((tab) {
          return buildTabBarViewItem(tab);
        }).toList(),
      ),
    );
  }

  Widget buildTabBarViewItem(tab) {
    if (tab.ref == "featured") {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('២០ ដាក់ប្រកាស់'), Text("ច្រោះ")
                ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _fakeData.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              itemBuilder: (context, index) {
                final FakeData item = _fakeData[index];
                return postItem1(item, index);
              },
              controller: _scrollController,
            ),
          ),
        ],
      );
    }
    return Center(
      child: new Text(
        tab.text,
        style: new TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget postItem1(FakeData item, index) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.0,
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
                                          image: NetworkImage(item.photo)),
                                    ),
                                  ),
                                ),
                                title: new Text(
                                  item.name,
                                  style: new TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: new Text(
                                  "តម្លៃ" + item.price,
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
                                margin: EdgeInsets.only(left: 20.0, top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ថ្នាក់ទី:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text(item.level,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Text('ម៉ោង:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text(item.time,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ទីកន្លែង:', style: TextStyle()),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text(
                                        item.location,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FakeData {
  final String name;
  final String location;
  final String time;
  final String price;
  final String level;
  final String photo;

  FakeData(
      {this.name,
      this.location,
      this.time,
      this.price,
      this.level,
      this.photo});
}

class CustomTab extends StatelessWidget {
  final String text;
  final String ref;
  CustomTab({this.text, this.ref});

  @override
  Widget build(BuildContext context) {
    return new Tab(text: text,);
  }
}
