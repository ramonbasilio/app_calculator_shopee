import 'package:flutter/material.dart';
import 'package:flutter_application_v1/page/amazon_page/amazon_page.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';
import 'package:flutter_application_v1/page/shopee_page/shopee_page.dart';
import 'package:flutter_application_v1/page/shopee_page/shopee_page2.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({super.key});

  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    ShopeePage2(),
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
    final isMobile = MediaQuery.of(context).size.width < 600;
    return isMobile ? _buildMobileLayout() : _buildDesktopLayout();
  }

  Scaffold _buildMobileLayout() {
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
      
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // Deixa redondo
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ), // Espaço interno para a imagem
                child: Image.asset('lib/assets/shopee.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // Deixa redondo
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ), // Espaço interno para a imagem
                child: Image.asset('lib/assets/mercado_livre.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // Deixa redondo
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ), // Espaço interno para a imagem
                child: Image.asset('lib/assets/amazon.png'),
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF332D2D),
        onTap: onItemTapped,
      ),
    );
  }

  Scaffold _buildDesktopLayout() {
    return Scaffold(
            appBar: AppBar(
        title: const Text(
          'Calculadora de Taxas - TESTE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF332D2D), //0xFF17181C
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Color(0xFF332D2D),
            selectedIndex: selectedIndex,
            onDestinationSelected: onItemTapped,
            labelType: NavigationRailLabelType.none,
            destinations: [
              NavigationRailDestination(
                icon: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30), // Deixa redondo
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('lib/assets/shopee.png'),
                  ),
                ),
                label: Text('Shopee'),
              ),
              NavigationRailDestination(
                icon: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30), // Deixa redondo
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('lib/assets/mercado_livre.png'),
                  ),
                ),
                label: Text(''),
              ),
              NavigationRailDestination(
                icon: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30), // Deixa redondo
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      5,
                    ), // Espaço interno para a imagem
                    child: Image.asset('lib/assets/amazon.png'),
                  ),
                ),
                label: Text(''),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widgetOptions[selectedIndex]),
        ],
      ),
    );
  }
}
