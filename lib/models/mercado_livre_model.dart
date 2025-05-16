// ignore_for_file: public_member_api_docs, sort_constructors_first
class MercadoLivreModel {
  String gain;
  String income;
  String totalTax;
  String flexForward;

  MercadoLivreModel([
    this.gain = '0,00',
    this.income = '0,00',
    this.totalTax= '0,00',
    this.flexForward = '0,00',
  ]);

  void clear() {
    gain = '0,00';
    income = '0,00';
    totalTax = '0,00';
    flexForward = '0,00';
  }
}
