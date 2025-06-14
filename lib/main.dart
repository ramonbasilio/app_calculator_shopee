import 'package:flutter/material.dart';
import 'package:flutter_application_v1/page/home_page/home_test.dart';
import 'package:flutter_application_v1/page/home_page/home_test_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Taxas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePageTest2(),
    );
  }
}