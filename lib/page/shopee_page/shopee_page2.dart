import 'package:flutter/material.dart';
import 'package:flutter_application_v1/calculus/calculus.dart';
import 'package:flutter_application_v1/models/shopee_model.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:html';

class ShopeePage2 extends StatefulWidget {
  const ShopeePage2({super.key});

  @override
  State<ShopeePage2> createState() => _ShopeePage2State();
}

enum TypeTax { freeShipping, noFreeShipping }

class _ShopeePage2State extends State<ShopeePage2> {
  final TextEditingController _custController = TextEditingController();
  final TextEditingController _gainController = TextEditingController();
  ShopeeModel shopeeModel = ShopeeModel();
  TypeTax _typeTax = TypeTax.freeShipping;


  void saveField(String data, String id) {
    window.localStorage[id] = data;
  }

  void saveResult(ShopeeModel data) {
    window.localStorage['incomeFieldShopee'] = data.income;
    window.localStorage['totalTaxFieldShopee'] = data.totalTax;
    window.localStorage['percentTaxFieldShopee'] = data.grossProfit;
    window.localStorage['listingFieldShopee'] = data.listing;
    window.localStorage['grossProfitFieldShopee'] = data.grossProfit;
  }

  void clearFields() {
    setState(() {
      _custController.clear();
      _gainController.clear();
      shopeeModel.clear();
    });
    window.localStorage.remove('custFieldShopee');
    window.localStorage.remove('gainFieldShopee');
  }

  @override
  void initState() {
    super.initState();
    _custController.text = window.localStorage['custFieldShopee'] ?? '';
    _gainController.text = window.localStorage['gainFieldShopee'] ?? '';
    shopeeModel.income = window.localStorage['incomeFieldShopee'] ?? '0,00';
    shopeeModel.totalTax = window.localStorage['totalTaxFieldShopee'] ?? '0,00';
    shopeeModel.grossProfit =
        window.localStorage['grossProfitFieldShopee'] ?? '0,00';
    shopeeModel.listing = window.localStorage['listingFieldShopee'] ?? '0,00';
  }

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
                width: isMobile
                    ? double.infinity
                    : 500, // Ajusta à largura da tela
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
                    resultContainer(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              saveField(
                                  _custController.text, 'custFieldShopee');
                              saveField(
                                  _gainController.text, 'gainFieldShopee');
            
                              final calculus = Calculus();
                              ShopeeModel? resultValue =
                                  calculus.calculusShopee2(
                                _custController.text,
                                _gainController.text,
                                context,
                                _typeTax == TypeTax.freeShipping
                                    ? true
                                    : false,
                              );

                              if (resultValue != null) {
                                setState(() {
                                  shopeeModel.income = resultValue.income;
                                  shopeeModel.totalTax = resultValue.totalTax;
                                  shopeeModel.grossProfit =
                                      resultValue.grossProfit;
                                  shopeeModel.listing = resultValue.listing;
                                  saveResult(resultValue);
                                });
                              }
                            },
                            child: const Text(
                              'Calcular',
                              style: TextStyle(color: Color(0xFF17181C)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              clearFields();
                            },
                            child: const Text(
                              'Limpar Campos',
                              style: TextStyle(color: Color(0xFF17181C)),
                            ),
                          ),
                        ),
                      ],
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
                              hintText: '0',
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
                        'Programa de frete grátis?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 73, 80, 84),
                        ),
                      ),
                    ),
                    typeTax()
                    //!isMobile ? Expanded(child: SizedBox()) : SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget typeTax() {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Flexible(
            child: ListTile(
              title: const Text(
                'Sim (20% de taxa + R\$ 4,00)',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeTax>(
                value: TypeTax.freeShipping,
                groupValue: _typeTax,
                onChanged: (TypeTax? value) {
                  setState(() {
                    _typeTax = value!;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: ListTile(
              title: const Text(
                'Não (14% de taxa + R\$ 4,00)',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Radio<TypeTax>(
                value: TypeTax.noFreeShipping,
                groupValue: _typeTax,
                onChanged: (TypeTax? value) {
                  setState(() {
                    _typeTax = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container resultContainer() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF332D2D),
        border: Border.all(color: Color(0xFF332D2D), width: 0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(
                      double.parse(shopeeModel.listing.replaceAll(',', '.'))),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Receita: R\$ ${shopeeModel.income}",
                style: TextStyle(
                  color: Color.fromARGB(255, 172, 176, 181),
                ),
              ),
              Text(
                "Total Taxas: R\$ ${shopeeModel.totalTax}",
                style: TextStyle(
                  color: Color.fromARGB(255, 172, 176, 181),
                ),
              ),
              Text(
                'Lucro (Bruto): R\$ ${shopeeModel.grossProfit}',
                style: TextStyle(
                  color: Color.fromARGB(255, 172, 176, 181),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
