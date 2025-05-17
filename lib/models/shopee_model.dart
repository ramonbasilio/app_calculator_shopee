class ShopeeModel {
  String income;
  String totalTax;
  String grossProfit;
  String listing;

  ShopeeModel([
    this.income = '0,00',
    this.totalTax = '0,00',
    this.grossProfit = '0,00',
    this.listing = '0,00',
  ]);

  void clear() {
    income = '0,00';
    totalTax = '0,00';
    grossProfit = '0,00';
    listing = '0,00';
  }
}
