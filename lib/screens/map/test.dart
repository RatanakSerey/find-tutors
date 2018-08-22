import 'dart:async';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, dynamic>> items = List.generate(
    20,
    (i) => {"name": "name${i}", "gender": "male", "address": "btb"},
  );
  ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  /// from - inclusive, to - exclusive
  Future<List<Map<String, dynamic>>> fakeRequest() async {
    return Future.delayed(Duration(seconds: 1), () {
      var arr = [
        {"name": "nickname", "gender": "female", "address": "pp"}
      ];
      return arr.toList();
    });
  }

  _loadMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<Map<String, dynamic>> newEntries = await fakeRequest();
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
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView builder"),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return _listItem(items[index], index);
          }
        },
        controller: _scrollController,
      ),
    );
  }

  Widget _listItem(item, i) {
    return ListTile(
      leading: Icon(Icons.book),
      title: Text(item['name']),
      subtitle: Text("${i}"),
      // onTap: () {
      //   setState(() {
      //     items.removeAt(i);
      //   });
      // },
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            items.removeAt(i);
          });
        },
      ),
    );
  }
}
