import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarSalesScreen extends StatefulWidget {
  @override
  _CarSalesScreenState createState() => _CarSalesScreenState();
}

class _CarSalesScreenState extends State<CarSalesScreen> {
  late Future<List<CarModel>> _carSalesFuture;

  @override
  void initState() {
    super.initState();
    _carSalesFuture = loadCarSalesData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: FutureBuilder(
        future: _carSalesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || (snapshot.data as List<CarModel>).isEmpty) {
            return Center(child: Text('No car sales data available'));
          } else {
            List<CarModel> carSales = snapshot.data as List<CarModel>;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carSales.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 500,
                  child: CarSalesCard(carModel: carSales[index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<CarModel>> loadCarSalesData() async {
    final String response = await rootBundle.loadString('assets/sample_data.json');
    final data = json.decode(response) as Map<String, dynamic>;
    final List<CarModel> carSales = (data['carSales'] as List)
        .map((item) => CarModel.fromJson(item))
        .toList();
    return carSales;
  }
}

class CarModel {
  final String title;
  final String description;
  final List<Car> cars;

  CarModel({
    required this.title,
    required this.description,
    required this.cars,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    var carsFromJson = json['cars'] as List;
    List<Car> carsList = carsFromJson.map((car) => Car.fromJson(car)).toList();

    return CarModel(
      title: json['title'],
      description: json['description'],
      cars: carsList,
    );
  }
}

class Car {
  final String name;
  final String imageUrl;

  Car({
    required this.name,
    required this.imageUrl,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class CarSalesCard extends StatelessWidget {
  final CarModel carModel;

  CarSalesCard({required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            carModel.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(carModel.description),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: carModel.cars.map((car) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Image.network(
                        car.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(car.name, textAlign: TextAlign.center),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}