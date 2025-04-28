import 'package:flutter/material.dart';
import 'package:flutter_application_v1/alerts/alerts.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';

class Calculus {
  double? calculusShopee(
    String cust,
    String gain,
    BuildContext context,
  ) {
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

  double? calculusMercadoLivre(
    TypeListing typeListing,
    TypeShipping typeShipping,
    String cust,
    String listing,
    BuildContext context,
  ) {
    // 8 a 28,9 -> 6,25
    // 29 a 49,9 -> 6,5
    // 50 a 78,9 -> 6,75
    //

    double taxTypeListing = 0.0;
    double taxTypeShipping = 0.0;
    double totalTax = 0.0;
    double gain = 0.0;
    Alerts alerts = Alerts();
    try {
      double _listing = double.parse(listing.replaceAll(',', '.'));
      double _cust = double.parse(cust.replaceAll(',', '.'));
      if (typeListing.name == 'classic') {
        totalTax = _listing * 0.14;
      } else {
        totalTax = _listing * 0.19;
      }
      print('primeira taxa $totalTax ');
      if (_listing < 79) {
        if (typeShipping.name == 'mercadoEnvios') {
          if (_listing > 8 && _listing <= 28.9) {
            totalTax += 6.25;
          }
          if (_listing >= 29 && _listing <= 49.9) {
            totalTax += 6.5;
          }
          if (_listing >= 50 && _listing <= 78.9) {
            totalTax += 6.75;
          }
        }
      }
      print('Total de taxas é R\$ $totalTax');
      return totalTax;
    } catch (_) {
      return null;
    }
  }
}
