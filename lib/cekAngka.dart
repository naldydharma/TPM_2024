import 'package:flutter/material.dart';

class cekAngka extends StatefulWidget {
  const cekAngka({Key? key}) : super(key: key);

  @override
  _cekAngkaState createState() => _cekAngkaState();
}

class _cekAngkaState extends State<cekAngka> {
  String _inputText = '';
  double result = 0;
  var status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Angka', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            icon: const Icon(Icons.home),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Angka',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_inputText.isEmpty) {
                      _showInputWarning();
                    } else {
                      _check();
                    }
                  },
                  child: Text('Cek', style: TextStyle(color: Colors.black87),),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('$status', style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  void _check() {
    double num1 = double.tryParse(_inputText) ?? 0;
    setState(() {
      result = num1 % 2;
      if (result == 0) {
        status = "Genap";
      } else {
        status = "Ganjil";
      }
    });
  }

  void _showInputWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda harus memasukkan sebuah angka terlebih dahulu.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

