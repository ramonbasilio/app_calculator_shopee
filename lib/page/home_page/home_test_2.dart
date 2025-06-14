import 'package:flutter/material.dart';
import 'package:flutter_application_v1/page/amazon_page/amazon_page.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';
import 'package:flutter_application_v1/page/shopee_page/shopee_page.dart';
import 'package:flutter_application_v1/page/shopee_page/shopee_page2.dart';

class HomePageTest2 extends StatefulWidget {
  const HomePageTest2({super.key});

  @override
  State<HomePageTest2> createState() => _HomePageTest2State();
}

class _HomePageTest2State extends State<HomePageTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      appBar: AppBar(
        title: const Text(
          'Taxas da Shopee',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF332D2D), //  0xFF17181C
        centerTitle: true,
      ),
      body: ShopeePage2(),
    );
  }
}
