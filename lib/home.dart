import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
          },
              icon: const Icon(Icons.logout), color: Colors.black,)
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
            ElevatedButton(
              onPressed: () {
                // Navigate to the kalkulator page
                Navigator.pushReplacementNamed(context, '/kalkulator');
              },
              child: const Text('Kalkulator'),
            ),
          ],
        ),
      ),
    );
  }
}
