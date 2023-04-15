import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/model/detail_science.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('artikel').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Gagal Mengambil Data'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final List<DocumentSnapshot> artikels = snapshot.data!.docs;
            return ListView.builder(
              itemCount: artikels.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> data =
                    artikels[index].data() as Map<String, dynamic>;
                return ListTile(
                  leading: Container(
                    color: Colors.grey[200],
                    height: 100,
                    width: 100,
                    child: Image.network(
                      data['gambar'],
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    data['judul'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    data['isi'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScience(
                          image: data['gambar'],
                          author: data['author'],
                          judul: data['judul'],
                          isi: data['isi'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
