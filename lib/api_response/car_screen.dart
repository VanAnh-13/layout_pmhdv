class Car {
  final String company;
  final String name;
  final String version;
  final String? engineType;
  final String price;

  Car({
    required this.company,
    required this.name,
    required this.version,
    this.engineType,
    required this.price,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      company: json['company'],
      name: json['name'],
      version: json['version'],
      engineType: json['engineType'],
      price: json['price'],
    );
  }
}
