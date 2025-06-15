import 'package:flutter/material.dart';

class Alerts {
  void errorConvertDouble(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Erro ao converter os valores de entrada. Verifique se os valores estão corretos.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void errorGain(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Insira um valor de ganho menor que 80%.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void errorTrubuteGain(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Diminua o valor do imposto ou do lucro.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

    void errorCust(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Diminua os valores. Limite de valor do anúncio é R\$ 1.000.000,00'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
