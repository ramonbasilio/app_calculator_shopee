import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_v1/calculus/calculus.dart';
import 'package:intl/intl.dart';

class MercadoLivrePage extends StatefulWidget {
  const MercadoLivrePage({super.key});

  @override
  State<MercadoLivrePage> createState() => _MercadoLivrePageState();
}

enum TypeListing { classic, premium }

enum TypeShipping { mercadoEnvios, full, flex }

class _MercadoLivrePageState extends State<MercadoLivrePage> {
  final TextEditingController _custController = TextEditingController();
  final TextEditingController _listingController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  TypeListing _typeListing = TypeListing.classic;
  TypeShipping _typeShipping = TypeShipping.mercadoEnvios;
  String result = '0,00';
  bool isEnabled = false;

  Calculus calculus = Calculus();

  @override
  void initState() {
    super.initState();
    _listingController.addListener(() {
      setState(() {
        isEnabled = calculus.checkListingValue(_listingController.text);
        if (_listingController.text.isEmpty) _weightController.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFF17181C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                // height: isMobile
                //     ? null
                //     : MediaQuery.of(context).size.height * 0.9,
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
                    custProduct(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Valor do Anúncio',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 73, 80, 84),
                        ),
                      ),
                    ),
                    valueListing(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: !isEnabled
                          ? Text(
                              'Peso Produto',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 73, 80, 84),
                              ),
                            )
                          : RichText(
                              text: TextSpan(
                                children: [
                                  //TextSpan(text: 'Peso Produto - '),
                                  TextSpan(
                                      text: 'Peso Produto -  Obrigado',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                    ),
                    valueWeight(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Tipo do Anúncio',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 73, 80, 84),
                        ),
                      ),
                    ),
                    typeListing(),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Tipo de Envio',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 73, 80, 84),
                        ),
                      ),
                    ),
                    typeShipping(),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          final resultValue = calculus.calculusMercadoLivre(
                            _typeListing,
                            _typeShipping,
                            _custController.text,
                            _listingController.text,
                            context,
                            _weightController.text,
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
                    !isMobile
                        ? SizedBox(
                            height: 20,
                          )
                        : SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF332D2D),
                        border:
                            Border.all(color: Color(0xFF332D2D), width: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lucro Bruto Estimado',
                            style: TextStyle(
                              color: Color.fromARGB(255, 172, 176, 181),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$result  %',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
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

  Row custProduct() {
    return Row(
      children: [
        Text(
          'R\$ ',
          style: TextStyle(
            fontSize: 30,
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
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Row valueListing() {
    return Row(
      children: [
        Text(
          'R\$ ',
          style: TextStyle(
            fontSize: 30,
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
            controller: _listingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: '0,00',
            ),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Row valueWeight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: TextFormField(
            enabled: isEnabled,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9,]'),
              ),
            ],
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
            controller: _weightController,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: '0,00',
              hintStyle: TextStyle(
                color: Colors
                    .grey.shade800, // Define a cor para garantir visibilidade
              ),
            ),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            'g',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget typeListing() {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Flexible(
            child: ListTile(
              title: const Text(
                'Anúncio Clássico',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeListing>(
                value: TypeListing.classic,
                groupValue: _typeListing,
                onChanged: (TypeListing? value) {
                  setState(() {
                    _typeListing = value!;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: ListTile(
              title: const Text(
                'Anúncio Premium',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeListing>(
                value: TypeListing.premium,
                groupValue: _typeListing,
                onChanged: (TypeListing? value) {
                  setState(() {
                    _typeListing = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget typeShipping() {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              title: const Text(
                'Mercado Envios',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeShipping>(
                value: TypeShipping.mercadoEnvios,
                groupValue: _typeShipping,
                onChanged: (TypeShipping? value) {
                  setState(() {
                    _typeShipping = value!;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: ListTile(
              title: const Text(
                'Full',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeShipping>(
                value: TypeShipping.full,
                groupValue: _typeShipping,
                onChanged: (TypeShipping? value) {
                  setState(() {
                    _typeShipping = value!;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: ListTile(
              title: const Text(
                'Flex',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeShipping>(
                value: TypeShipping.flex,
                groupValue: _typeShipping,
                onChanged: (TypeShipping? value) {
                  setState(() {
                    _typeShipping = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
