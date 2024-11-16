class PriceRange {
  final String priceRange;
  final int totalSale;

  PriceRange({required this.priceRange, required this.totalSale});

  factory PriceRange.fromJson(Map<String, dynamic> json) {
    return PriceRange(
      priceRange: json['priceRange'],
      totalSale: json['totalSale'],
    );
  }
}