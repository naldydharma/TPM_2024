import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
          },
              icon: const Icon(Icons.logout), color: Colors.white,)
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            DataTable(
              columns: const [
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('NIM')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Muhammad Rainaldy Dharmawan')),
                  DataCell(Text('123210087')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Bagas Makayasa')),
                  DataCell(Text('123210099')),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  onPressed: () {
                    // Navigate to the kalkulator page
                    Navigator.pushReplacementNamed(context, '/kalkulator');
                    },
                  child: const Text('Kalkulator', style: TextStyle(color: Colors.black87),),
                  ),
                  ElevatedButton(
                  onPressed: () {
                    // Navigate to the cek angka page
                    Navigator.pushReplacementNamed(context, '/cekAngka');
                  },
                  child: const Text('Cek Angka', style: TextStyle(color: Colors.black87),),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
