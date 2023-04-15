import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';

class DetailPage extends StatelessWidget {
  final url, title, content, publishedAt, author, urlToImage;

  DetailPage(
      {this.title = "",
      this.url = "",
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerColor,
        centerTitle: true,
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  margin: const EdgeInsets.all(20),
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey),
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$publishedAt',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('$content'),
                const Divider(),
                Text('$author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
