class RegionData {
  final String region;
  final int sales;

  RegionData({required this.region, required this.sales});

  factory RegionData.fromJson(Map<String, dynamic> json) {
    return RegionData(
      region: json['region'],
      sales: json['sales'],
    );
  }
}

class SalePlace {
  final String companyAndName;
  final List<RegionData> data;

  SalePlace({required this.companyAndName, required this.data});

  factory SalePlace.fromJson(Map<String, dynamic> json) {
    return SalePlace(
      companyAndName: json['companyAndName'],
      data: (json['data'] as List)
          .map((item) => RegionData.fromJson(item))
          .toList(),
    );
  }
}