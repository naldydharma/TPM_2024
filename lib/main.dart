import 'package:flutter/material.dart';
import 'package:tugas_tpm1/kalkulator.dart';
import 'package:tugas_tpm1/login_page.dart';
import 'package:tugas_tpm1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => const LoginPage(), // Define the route for the login page
        '/home': (context) => const HomePage(),   // Define the route for the home page
        '/kalkulator': (context) => const KalkulatorPage(),   // Define the route for the kalkulator page

      },
    );
  }
}


