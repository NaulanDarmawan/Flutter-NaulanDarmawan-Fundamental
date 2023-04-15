import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/detail_berita.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _post = [];
  @override
  void initState() {
    super.initState();
    _getDataBerita();
  }

  Future _getDataBerita() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=apple&from=2023-04-14&to=2023-04-14&sortBy=popularity&apiKey=701ee7d68a884698863ec203000520fd"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        debugPrint(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _post = data['articles'];
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _post[index]['urlToImage'] != null
                  ? Image.network(
                      _post[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            title: Text(
              '${_post[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_post[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    url: _post[index]['url'],
                    title: _post[index]['title'],
                    content: _post[index]['content'],
                    urlToImage: _post[index]['urlToImage'],
                    author: _post[index]['author'],
                    publishedAt: _post[index]['publishedAt'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
