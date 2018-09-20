import 'dart:async';
import 'dart:convert';
import 'package:find_tutors/models/subject.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/utils/index.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // List<Subject> _subjects = [];
  List<Subject> _subjects = List.generate(
    25,
    (i) => Subject(id: '${i + 1}', khName: 'yiman', enName: 'posts'),
  );
  Future fetchSubject(String params) {
    String url = 'http://192.168.43.3:3000/find-subject/${params}';
    var httpClient = http.Client();
    return httpClient.get(url).then((response) {
      var result = json.decode(response.body);

      result.map((o) => _subjects.add(Subject.fromMap(o))).toList();
      setState(() {
        _subjects;
      });
    });
  }

  ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    // fetchSubject("{}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView builder"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _subjects.length,
              padding: const EdgeInsets.only(bottom: 30.0),
              itemBuilder: (context, index) {
                final Subject subject = _subjects[index];
                return _listItem(subject, index);
              },
              controller: _scrollController,
            ),
          ),
          isPerformingRequest ? _buildProgressIndicator() : Container()
        ],
      ),
    );
  }

  Widget _listItem(Subject item, int i) {
    double width = MediaQuery.of(context).size.width;
    // return ListTile(
    //   leading: Icon(Icons.book),
    //   title: Text(item.khName.toString() + item.id.toString()),
    //   subtitle: Text(item.enName.toString()),
    //   onTap: () {
    //     // fetchSubject(json.encode(item.toMap()));
    //   },
    //   trailing: IconButton(
    //     icon: Icon(
    //       Icons.delete,
    //       color: Colors.red,
    //     ),
    //     onPressed: () {
    //       setState(() {
    //         _subjects.removeAt(i);
    //       });
    //     },
    //   ),
    // );
    return new ListTile(
      title: new Card(
        elevation: 2.0,
        child: new Container(
            // alignment: Alignment.topCenter,
            margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Image.asset(
                        "assets/images/sub_icon.png",
                        height: 80.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: width - 200.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  item.khName.toString(),
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                IconButton(
                                  icon: Icon(
                                    FeatherIcons.star,
                                    color: CommonColors.primary,
                                    // size: 24.0,
                                  ),
                                  onPressed: () {},
                                  alignment: Alignment.center,
                                  iconSize: 20.0,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(item.id.toString() +
                                    ' ' +
                                    item.enName.toString())
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      FeatherIcons.chevron_right,
                      color: CommonColors.primary,
                      size: 36.0,
                    ),
                  ],
                )
              ],
            )),
      ),
      onTap: () {},
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(
            strokeWidth: 4.3,
          ),
        ),
      ),
    );
  }

  _loadMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<Subject> newEntries = await fakeRequest();

      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }

      setState(() {
        _subjects.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Future<List<Subject>> fakeRequest() async {
    return Future.delayed(Duration(seconds: 1), () {
      // return [
      //   SubjectItem(id: "0099", khName: "veasna", enName: "male"),
      //   SubjectItem(id: "0100", khName: "veasna1", enName: "male1"),
      //   SubjectItem(id: "0101", khName: "veasna12", enName: "male12"),
      // ];
      return [];
    });
  }
}
