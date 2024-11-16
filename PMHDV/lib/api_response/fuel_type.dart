class FuelType {
  final String fuelType;
  final int totalSale;

  FuelType({required this.fuelType, required this.totalSale});

  factory FuelType.fromJson(Map<String, dynamic> json) => FuelType(
        fuelType: json['fuelType'],
        totalSale: json['totalSale'],
      );
}
