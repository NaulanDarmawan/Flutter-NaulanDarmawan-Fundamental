import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';

class DetailScience extends StatelessWidget {
  final judul, isi, author, image;

  DetailScience({
    this.judul = "",
    this.isi = "",
    this.author,
    this.image,
  });

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
          image != null
              ? Image.network(image)
              : Container(
                  margin: const EdgeInsets.all(20),
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey),
                ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                  color: Colors.black,
                ),
                Center(
                  child: Text(
                    '$judul',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: subJudulTextStyle.copyWith(fontSize: 20),
                  ),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Author: $author',
                    style: subJudulTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('$isi'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
