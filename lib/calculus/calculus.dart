class Calculus {
  double calculusShopee(String cust, String gain) {
    double anuncio = 0.0;
    print('Custo: $cust');
    print('Lucro: $gain');
    double _gain = double.parse(gain.replaceAll(',', '.'));
    double _cust = double.parse(cust.replaceAll(',', '.'));

    if ((_gain / 100) - 0.8 == 0) {
      throw ArgumentError(
        "Divisão por zero detectada. Verifique os valores de entrada.",
      );
    }
    anuncio = ((-4 - _cust) / ((_gain / 100) - 0.8));
    print('Valor do anúncio é R\$ ${anuncio.toStringAsFixed(2)}');
    return anuncio;
  }
}
