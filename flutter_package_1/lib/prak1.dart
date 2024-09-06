import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tebak Angka 1-100'),
        ),
        body: SimpleGuessGame(),
      ),
    );
  }
}

class SimpleGuessGame extends StatefulWidget {
  @override
  _SimpleGuessGameState createState() => _SimpleGuessGameState();
}

class _SimpleGuessGameState extends State<SimpleGuessGame> {
  final TextEditingController _controller = TextEditingController(); // Kontrol input teks
  final int _target = Random().nextInt(100) + 1; // Angka acak antara 1 dan 100
  String _message = ''; // Pesan untuk menampilkan hasil

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Tengah-tengah
        children: [
          TextField(
            controller: _controller, // Menghubungkan kontroler
            keyboardType: TextInputType.number, // Hanya input angka
            decoration: InputDecoration(
              labelText: 'Tebak angka 1-100', // Label pada kotak teks
            ),
          ),
          SizedBox(height: 10), // Jarak vertikal
          ElevatedButton(
            onPressed: () {
              setState(() {
                int guess = int.tryParse(_controller.text) ?? 0; // Mengambil dan mengonversi input
                if (guess < _target) {
                  _message = 'Terlalu rendah!'; // Feedback jika tebakan rendah
                } else if (guess > _target) {
                  _message = 'Terlalu tinggi!'; // Feedback jika tebakan tinggi
                } else {
                  _message = 'Selamat! Anda menebak dengan benar.'; // Feedback jika tebakan benar
                }
              });
            },
            child: Text('Submit'), // Label tombol
          ),
          SizedBox(height: 10), // Jarak vertikal
          Text(
            _message, // Menampilkan pesan hasil
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
