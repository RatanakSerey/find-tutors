import 'dart:async';
import 'dart:convert';
import 'package:find_tutors/model/subject.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // List<Subject> _subjects = [];
  List<Subject> _subjects = List.generate(
    25,
    (i) => Subject(id: '${i+1}', khName: 'yiman', enName: 'male'),
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
    return ListTile(
      leading: Icon(Icons.book),
      title: Text(item.khName.toString() + item.id.toString()),
      subtitle: Text(item.enName.toString()),
      onTap: () {
        // fetchSubject(json.encode(item.toMap()));
      },
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            _subjects.removeAt(i);
          });
        },
      ),
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


