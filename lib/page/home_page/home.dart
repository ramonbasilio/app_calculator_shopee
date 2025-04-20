import 'package:flutter/material.dart';
import 'package:flutter_application_v1/page/amazon_page/amazon_page.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';
import 'package:flutter_application_v1/page/shopee_page/shopee_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    ShopeePage(),
    MercadoLivrePage(),
    AmazonPage(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      appBar: AppBar(
        title: const Text(
          'Calculadora de Taxas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF332D2D), //0xFF17181C
        centerTitle: true,
      ),
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Mercado Livre',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Amazon'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF332D2D),
        onTap: onItemTapped,
      ),
    );
  }
}
