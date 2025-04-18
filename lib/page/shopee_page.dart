import 'package:flutter/material.dart';

class ShopeePage extends StatefulWidget {
  const ShopeePage({super.key});

  @override
  State<ShopeePage> createState() => _ShopeePageState();
}

enum TypeOperation { anuncio, lucro }

class _ShopeePageState extends State<ShopeePage> {
  final TextEditingController _custController = TextEditingController();
  final TextEditingController _valueOptionController = TextEditingController();
  TypeOperation? _typeOperation = TypeOperation.anuncio;
  double resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopee Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Row(
                children: [
                  Text('Custo do Produto'),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _custController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (_custController.text.isEmpty) {
                          setState(() {
                            resultado = 0.0;
                          });
                          return;
                        } else {
                          setState(() {
                            resultado = taxaShopee(
                              double.parse(_custController.text),
                              double.parse(_valueOptionController.text),
                              _typeOperation!.name,
                            );
                          });
                        }
                      },
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Tipo de operação:'),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Anúncio'),
                          leading: Radio<TypeOperation>(
                            value: TypeOperation.anuncio,
                            groupValue: _typeOperation,
                            onChanged: (TypeOperation? value) {
                              setState(() {
                                _typeOperation = value;
                                if (_custController.text.isEmpty ||
                                    _valueOptionController.text.isEmpty) {
                                  return;
                                }
                                resultado = taxaShopee(
                                  double.parse(_custController.text),
                                  double.parse(_valueOptionController.text),
                                  _typeOperation!.name,
                                );
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Lucro'),
                          leading: Radio<TypeOperation>(
                            value: TypeOperation.lucro,
                            groupValue: _typeOperation,
                            onChanged: (TypeOperation? value) {
                              setState(() {
                                _typeOperation = value;
                                if (_custController.text.isEmpty ||
                                    _valueOptionController.text.isEmpty) {
                                  return;
                                }
                                resultado = taxaShopee(
                                  double.parse(_custController.text),
                                  double.parse(_valueOptionController.text),
                                  _typeOperation!.name,
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _typeOperation == TypeOperation.anuncio
                  ? Row(
                    children: [
                      SizedBox(width: 120, child: Text('Valor do Anúncio')),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _valueOptionController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (_valueOptionController.text.isEmpty) {
                              setState(() {
                                resultado = 0.0;
                              });
                              return;
                            } else {
                              setState(() {
                                resultado = taxaShopee(
                                  double.parse(_custController.text),
                                  double.parse(_valueOptionController.text),
                                  _typeOperation!.name,
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      SizedBox(width: 120, child: Text('Valor do Lucro (%)')),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _valueOptionController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (_valueOptionController.text.isEmpty) {
                              setState(() {
                                resultado = 0.0;
                              });
                              return;
                            } else {
                              setState(() {
                                resultado = taxaShopee(
                                  double.parse(_custController.text),
                                  double.parse(_valueOptionController.text),
                                  _typeOperation!.name,
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 20),
              Text('Resultado'),
              _typeOperation!.name == 'lucro'
                  ? Text('Valor do anuncio é R\$ ${resultado.toStringAsFixed(2)}')
                  : Text('Valor do lucro é ${resultado.toStringAsFixed(2)}%'),
            ],
          ),
        ),
      ),
    );
  }

  double taxaShopee(double custo, double valor, String tipoConta) {
    double lucroPercentual = 0.0;
    double anuncio = 0.0;

    if (tipoConta == 'anuncio') {
      double receita = 0.8 * valor - 4;
      double lucro = receita - custo;
      lucroPercentual = (lucro / valor) * 100;
      print('Valor do lucro é ${lucroPercentual.toStringAsFixed(2)}%');
      return lucroPercentual;
    }

    if (tipoConta == "lucro") {
      print(tipoConta);
      if ((valor / 100) - 0.8 == 0) {
        throw ArgumentError(
          "Divisão por zero detectada. Verifique os valores de entrada.",
        );
      }
      anuncio = (-4 - custo) / ((valor / 100) - 0.8);
      print('Valor do anúncio é R\$ ${anuncio.toStringAsFixed(2)}');
      return anuncio;
    }

    throw ArgumentError("Tipo de conta inválido: $tipoConta");
  }
}
