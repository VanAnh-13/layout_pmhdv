import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_response/car_provider.dart';

class IngredientsLayout extends StatefulWidget {
  @override
  _IngredientsLayoutState createState() => _IngredientsLayoutState();
}

class _IngredientsLayoutState extends State<IngredientsLayout> {
  @override
  void initState() {
    super.initState();
    Provider.of<CarProvider>(context, listen: false).fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Management Table'),
      ),
      body: Consumer<CarProvider>(
        builder: (context, carProvider, child) {
          if (carProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (carProvider.errorMessage != null) {
            return Center(child: Text('Error: ${carProvider.errorMessage}'));
          } else if (carProvider.cars.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Company')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Version')),
                  DataColumn(label: Text('Engine Type')),
                  DataColumn(label: Text('Price')),
                ],
                rows: carProvider.cars.map((car) => DataRow(cells: [
                  DataCell(Text(car.company)),
                  DataCell(Text(car.name)),
                  DataCell(Text(car.version)),
                  DataCell(Text(car.engineType ?? 'N/A')),
                  DataCell(Text(car.price)),
                ])).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}