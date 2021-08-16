import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailNews extends StatelessWidget {
  final url,title, content, publishedAt, author, urlToImage;

  DetailNews({this.title="", this.url="", this.content, this.publishedAt, this.author, this.urlToImage});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            urlToImage != null ? Image.network(urlToImage):
            Container(
              margin: EdgeInsets.all(20),
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: Colors.grey
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$publishedAt',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('$content', textAlign: TextAlign.justify,),
                  Divider(),
                  Text('$author', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  Text('$url', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
