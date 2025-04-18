import 'package:flutter/material.dart';
import 'package:flutter_application_v1/calculus/calculus.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter/services.dart';

class PageInicial extends StatefulWidget {
  const PageInicial({super.key});

  @override
  State<PageInicial> createState() => _PageInicialState();
}

class _PageInicialState extends State<PageInicial> {
  final TextEditingController _custController = TextEditingController(
    text: '0,00',
  );
  final TextEditingController _gainController = TextEditingController(
    text: '10',
  );

  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Shopee',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Custo do Produto',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 73, 80, 84),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'R\$ ',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Flexible(
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),],

                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: _custController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Lucro desejado',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 73, 80, 84),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '% ',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Flexible(
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: _gainController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Calculus calculus = Calculus();
                      result = calculus.calculusShopee(
                        _custController.text,
                        _gainController.text,
                      );
                    });
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Color(0xFF17181C)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 500,
                height: 180,
                decoration: BoxDecoration(
                  color: Color(0xFF332D2D),
                  border: Border.all(color: Color(0xFF332D2D), width: 0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preço do anúncio',
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 176, 181),
                      ),
                    ),
                    Text(
                      'R\$ ${result.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
