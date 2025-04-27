import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MercadoLivrePage extends StatefulWidget {
  const MercadoLivrePage({super.key});

  @override
  State<MercadoLivrePage> createState() => _MercadoLivrePageState();
}

class _MercadoLivrePageState extends State<MercadoLivrePage> {
  final TextEditingController _custController = TextEditingController();
  final TextEditingController _gainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      height:
                          isMobile
                              ? null
                              : MediaQuery.of(context).size.height * 0.85,
                      width: isMobile ? double.infinity : 500,
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
                            'Mercado Livre',
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'R\$ ',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
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
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
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
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
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
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Adicione o restante do seu código aqui
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
