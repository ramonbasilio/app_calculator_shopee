class ShopeeModel {
  String income;
  String totalTax;
  String percentTax;

  ShopeeModel([
    this.income = '0,00',
    this.totalTax = '0,00',
    this.percentTax = '0',
  ]);

  void clear() {
    income = '0,00';
    totalTax = '0,00';
    percentTax = '0';
  }
}
