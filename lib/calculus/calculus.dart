import 'package:flutter/material.dart';
import 'package:flutter_application_v1/alerts/alerts.dart';
import 'package:flutter_application_v1/calculus/tableMercadoLivreTax.dart';
import 'package:flutter_application_v1/models/mercado_livre_model.dart';
import 'package:flutter_application_v1/page/mercado_livre_page/mercado_livre_page.dart';

class Calculus {
  Tablemercadolivretax _tablemercadolivretax = Tablemercadolivretax();

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

  String? calculusMercadoLivre(
      TypeListing typeListing,
      TypeShipping typeShipping,
      String custStr,
      String listingStr,
      BuildContext context,
      [String? weight]) {
    // 8 a 28,9 -> 6,25
    // 29 a 49,9 -> 6,5
    // 50 a 78,9 -> 6,75
    //

    //double taxTypeListing = 0.0;
    //double taxTypeShipping = 0.0;
    double totalTax = 0.0;
    double gain = 0.0;
    Alerts alerts = Alerts();
    try {
      double listing = double.parse(listingStr.replaceAll(',', '.'));
      double cust = double.parse(custStr.replaceAll(',', '.'));
      if (typeListing.name == 'classic') {
        totalTax = listing * 0.14;
      } else {
        totalTax = listing * 0.19;
      }
      if (listing < 79) {
        if (typeShipping.name == 'mercadoEnvios' ||
            typeShipping.name == 'full' ||
            typeShipping.name == 'flex') {
          if (listing > 8 && listing <= 28.9) {
            totalTax += 6.25;
          }
          if (listing >= 29 && listing <= 49.9) {
            totalTax += 6.5;
          }
          if (listing >= 50 && listing <= 78.9) {
            totalTax += 6.75;
          }
        }
        gain = ((listing - totalTax - cust) / listing) * 100;
        print('Lucro será de $gain %');
        print('Taxas totais: $totalTax');
        return gain.toStringAsFixed(2).replaceAll('.', ',');
      }
      if (listing >= 79) {
        if (typeShipping.name == 'mercadoEnvios' ||
            typeShipping.name == 'full') {
          if (weight != null) {
            double weightDouble = double.parse(weight.replaceAll(',', '.'));
            totalTax = _tablemercadolivretax.taxMercadoLivreFull(weightDouble);
          }
        }
        gain = ((listing - totalTax - cust) / listing) * 100;
        return gain.toStringAsFixed(2).replaceAll('.', ',');
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  MercadoLivreModel? calculusMercadoLivre2(
      TypeListing typeListing,
      TypeShipping typeShipping,
      String custStr,
      String listingStr,
      BuildContext context,
      [String? weight]) {
    // 8 a 28,9 -> 6,25
    // 29 a 49,9 -> 6,5
    // 50 a 78,9 -> 6,75
    //

    //double taxTypeListing = 0.0;
    //double taxTypeShipping = 0.0;
    double totalTax = 0.0;
    double gain = 0.0;
    Alerts alerts = Alerts();
    try {
      double listing = double.parse(listingStr.replaceAll(',', '.'));
      double cust = double.parse(custStr.replaceAll(',', '.'));
      if (typeListing.name == 'classic') {
        totalTax = listing * 0.14;
      } else {
        totalTax = listing * 0.19;
      }
      if (listing < 79) {
        if (listing > 8 && listing <= 28.9) {
          totalTax += 6.25;
        }
        if (listing >= 29 && listing <= 49.9) {
          totalTax += 6.5;
        }
        if (listing >= 50 && listing <= 78.9) {
          totalTax += 6.75;
        }
        gain = ((listing - totalTax - cust) / listing) * 100;
        MercadoLivreModel mercadoLivreModel = MercadoLivreModel(
          gain.toStringAsFixed(2).replaceAll('.', ','),
          calculusIncome(listing, totalTax),
          totalTax.toStringAsFixed(2).replaceAll('.', ','),
        );
        if (typeShipping.name == 'flex') {
          mercadoLivreModel.flexForward = '15,30';
        }
        return mercadoLivreModel;
      }
      if (listing >= 79) {
        if (typeShipping.name == 'mercadoEnvios' ||
            typeShipping.name == 'full') {
          if (weight != null) {
            double weightDouble = double.parse(weight.replaceAll(',', '.'));
            totalTax = _tablemercadolivretax.taxMercadoLivreFull(weightDouble);
          }
        }
        gain = ((listing - totalTax - cust) / listing) * 100;
        MercadoLivreModel mercadoLivreModel = MercadoLivreModel(
          gain.toStringAsFixed(2).replaceAll('.', ','),
          calculusIncome(listing, totalTax),
          totalTax.toStringAsFixed(2).replaceAll('.', ','),
        );
        return mercadoLivreModel;
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  bool checkListingValue(String? value) {
    if (value!.isNotEmpty) {
      double valueDouble = double.parse(value.replaceAll(',', '.'));
      if (valueDouble >= 79) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String calculusIncome(double listing, double totalTax) {
    final result = listing - totalTax;
    return result.toStringAsFixed(2).replaceAll('.', ',');
  }
}
