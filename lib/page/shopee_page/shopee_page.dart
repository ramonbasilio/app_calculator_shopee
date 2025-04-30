import 'package:flutter/material.dart';
import 'package:flutter_application_v1/calculus/calculus.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class ShopeePage extends StatefulWidget {
  const ShopeePage({super.key});

  @override
  State<ShopeePage> createState() => _ShopeePageState();
}

class _ShopeePageState extends State<ShopeePage> {
  final TextEditingController _custController = TextEditingController();
  final TextEditingController _gainController = TextEditingController();

  double result = 0.0;

  @override
  Widget build(BuildContext context) {
   final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                //height: isMobile ? null : MediaQuery.of(context).size.height * 0.85,
                width: isMobile ? double.infinity : 500, // Ajusta à largura da tela
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10.0),
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
                    const SizedBox(height: 10),
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
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Flexible(
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9,]'),
                              ),
                            ],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            controller: _custController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: '0,00',
                            ),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Flexible(
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9,]'),
                              ),
                            ],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            controller: _gainController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: '00',
                            ),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          final calculus = Calculus();
                          final resultValue = calculus.calculusShopee(
                            _custController.text,
                            _gainController.text,
                            context,
                          );
              
                          if (resultValue != null) {
                            setState(() {
                              result = resultValue;
                            });
                          }
                        },
                        child: const Text(
                          'Calcular',
                          style: TextStyle(color: Color(0xFF17181C)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //!isMobile ? Expanded(child: SizedBox()) : SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 120,
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
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(result),
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
