// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  var alldataList = [];
  var dataList = [];
  bool result = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 60,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by title',
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      searchList(_searchController.text);
                                    })),
                            onChanged: searchList,
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return dataCard(
                        dataList[index]['title'],
                        dataList[index]['body'],
                      );
                    }),
              ],
            ),
          ),
        ));
  }

  Container dataCard(String _title, String _content) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
        ),
        subtitle: Text(_content),
      ),
    );
  }

  Future getData() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);
      var responseData = json.decode(response.body);
      setState(() {
        alldataList = responseData;
        dataList = responseData;
      });
    } catch (e) {
      e.toString();
    }
  }

  void searchList(String query) {
    final _searchList = alldataList.where((dataList) {
      final listTitle = dataList['title'].toLowerCase();
      final input = query.toLowerCase();
      return listTitle.contains(input);
    }).toList();
    setState(() {
      dataList = _searchList;
    });
  }
}
