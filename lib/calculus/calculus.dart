import 'package:flutter/material.dart';
import 'package:flutter_application_v1/alerts/alerts.dart';

class Calculus {
  double? calculusShopee(String cust, String gain, BuildContext context) {
    double anuncio = 0.0;
    Alerts alerts = Alerts();
    try {
      double _gain = double.parse(gain.replaceAll(',', '.'));
      double _cust = double.parse(cust.replaceAll(',', '.'));
      if ((_gain / 100) - 0.8 == 0) {
        alerts.errorGain(context);
        return null;
      }
      anuncio = ((-4 - _cust) / ((_gain / 100) - 0.8));
      if (anuncio < 0) {
        alerts.errorGain(context);
        return null;
      }
      return anuncio;
    } catch (e) {
      alerts.errorConvertDouble(context);
      return null;
    }
  }

  
}
