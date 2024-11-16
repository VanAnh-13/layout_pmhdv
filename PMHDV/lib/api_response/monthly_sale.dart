class CarSalesData {
  final String company;
  final int totalSale;

  CarSalesData({required this.company, required this.totalSale});

  factory CarSalesData.fromJson(Map<String, dynamic> json) {
    return CarSalesData(
      company: json['company'] as String,
      totalSale: json['totalSale'] as int,
    );
  }
}
