import 'package:flutter/cupertino.dart';
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
    int number1 = int.tryParse(_number1Controller.text) ?? 0;
    int number2 = int.tryParse(_number2Controller.text) ?? 0;
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
        title: const Text('Kalkulator'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/home');
          },
              icon: const Icon(Icons.home)
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _number1Controller,
                    keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))], // Only allow numbers
                    decoration: const InputDecoration(
                      hintText: 'Angka 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _number2Controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))], // Only allow numbers
                    decoration: const InputDecoration(
                      hintText: 'Angka 2',
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
                  child: const Text('+', style: TextStyle(fontSize: 25)),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('Kurang'),
                  child: const Text('-', style: TextStyle(fontSize: 30),),
                ),
                ElevatedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/home');
                }, icon: const Icon(Icons.home)
                ),
              ],
            ),
            Text(
              'Hasil: $_result',
              style: const TextStyle(fontSize: 20),
            ),
          ],
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