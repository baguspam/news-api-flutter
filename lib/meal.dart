import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Makanan"),
      ),
      body: ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              color: Colors.grey[100],
              height: 100,
              width: 100,
              child: Center(),
            ),
            title: Text(
              "Title",
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "Description",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: (){

            },
          );
        },

      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2021-07-13&sortBy=publishedAt&apiKey=be14be3a5ea949858c0c15edca7cd40d"));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}

