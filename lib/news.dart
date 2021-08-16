import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meal/news_detail.dart';

import 'config.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Berita"),
      ),
      body: ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              color: Colors.grey[100],
              height: 100,
              width: 100,
              child: _get[index]['urlToImage'] != null ?
              Image.network(
                _get[index]['urlToImage'],
                width: 100,
                fit: BoxFit.cover,
              ): Center(),
            ),
            title: Text(
              "${_get[index]['title']}",
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "${_get[index]['description']}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailNews(
                    url: _get[index]['url'],
                    title: _get[index]['title'],
                    content: _get[index]['content'],
                    urlToImage: _get[index]['urlToImage'],
                    author: _get[index]['author'],
                    publishedAt: _get[index]['publishedAt'],
                  ),
                ),
              );
            },
          );
        },

      ),
    );
  }

  Future _getNews() async {
    try {
      final response = await http.get(Uri.parse(
          Config().urlApi+"top-headlines?country=id&apiKey="+Config().apiKey));
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

