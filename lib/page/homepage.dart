import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double result = 0;
  var formKey = GlobalKey<FormState>();
  var angka1 = TextEditingController();
  var angka2 = TextEditingController();

  void penjumlahan() {
    setState(() {
      if (formKey.currentState!.validate()) {
        result = double.parse(angka1.text) + double.parse(angka2.text);
      }
    });
  }

  void pengurangan() {
    setState(() {
      if (formKey.currentState!.validate()) {
        result = double.parse(angka1.text) - double.parse(angka2.text);
      }
    });
  }

  void perkalian() {
    setState(() {
      if (formKey.currentState!.validate()) {
        result = double.parse(angka1.text) * double.parse(angka2.text);
      }
    });
  }

  void pembagian() {
    setState(() {
      if (formKey.currentState!.validate()) {
        result = double.parse(angka1.text) / double.parse(angka2.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Naulan'),
        backgroundColor: Colors.indigo[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text("Hasil = $result", style: const TextStyle(fontSize: 50)),
              textFormField(angka1, "Masukkan Angka Pertama"),
              textFormField(angka2, "Masukkan Angka Kedua"),
              buttonAritmatika(penjumlahan, "Penjumlahan", Colors.pink),
              buttonAritmatika(pengurangan, "Pengurangan", Colors.green),
              buttonAritmatika(perkalian, "Perkalian", Colors.amber),
              buttonAritmatika(pembagian, "Pembagian", Colors.lime),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormField(TextEditingController controller, String labelText) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mohon Masukkan Angka';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }

  Widget buttonAritmatika(
      VoidCallback onPressed, String namaButton, Color color) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      height: 75,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(namaButton)),
    );
  }
}
