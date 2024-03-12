import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import library for input formatters

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({Key? key}) : super(key: key);

  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<KalkulatorPage> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  int _result = 0;

  void _calculateResult(String operation) {
    String input1 = _number1Controller.text;
    String input2 = _number2Controller.text;

    // Periksa apakah kedua input sudah diisi
    if (input1.isEmpty || input2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mohon isi kedua angka terlebih dahulu.'),
        ),
      );
      return; // Hentikan perhitungan jika salah satu input kosong
    }

    int number1 = int.tryParse(input1) ?? 0;
    int number2 = int.tryParse(input2) ?? 0;

    // Periksa untuk pembagian dengan nol
    if (operation == 'Kurang' && number2 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Angka kedua tidak boleh nol untuk operasi pengurangan.'),
        ),
      );
      return;
    }

    setState(() {
      if (operation == 'Tambah') {
        _result = number1 + number2;
      } else if (operation == 'Kurang') {
        _result = number1 - number2;
      }
    });
  }

  void _reset() {
    setState(() {
      _number1Controller.clear();
      _number2Controller.clear();
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator', style: TextStyle(color: Colors.white),),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: _number1Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Angka 1',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: _number2Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Angka 2',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calculateResult('Tambah'),
                    child: const Text('+', style: TextStyle(fontSize: 25, color: Colors.black87)),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateResult('Kurang'),
                    child: const Text('-', style: TextStyle(fontSize: 30, color: Colors.black87)),
                  ),
                  ElevatedButton(
                    onPressed: _reset,
                    child: const Text('Reset', style: TextStyle(color: Colors.black87)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Hasil: $_result',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }
}
