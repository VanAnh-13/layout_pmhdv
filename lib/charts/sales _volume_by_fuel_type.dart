import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout_pmhdv/api_response/fuel_type_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../api_response/fuel_type.dart';
import '../api_response/monthly_sales_chart_provider.dart';

class SalesVolumeByFuelType extends StatefulWidget {
  const SalesVolumeByFuelType({super.key});

  @override
  State<SalesVolumeByFuelType> createState() => _SalesVolumeByFuelTypeState();
}

class _SalesVolumeByFuelTypeState extends State<SalesVolumeByFuelType> {
  @override
  void initState() {
  super.initState();
  Provider.of<FuelTypeProvider>(context, listen: false).fetchFuelTypes(context);
  Provider.of<MonthlySalesChartProvider>(context, listen: false).fetchSalesData(1);
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FuelTypeProvider>(
          builder: (context, fuelTypeProvider, child) {
            if (fuelTypeProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (fuelTypeProvider.fuelTypes.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              final random = Random();
              final colors = List<Color>.generate(
                fuelTypeProvider.fuelTypes.length,
                (index) => Color.fromARGB(
                  255,
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                ),
              );

              return SfCircularChart(
                title: ChartTitle(text: "Sales volume by fuel type"),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
                series: <CircularSeries<FuelType, String>>[
                  PieSeries<FuelType, String>(
                    dataSource: fuelTypeProvider.fuelTypes,
                    xValueMapper: (FuelType data, _) => data.fuelType,
                    yValueMapper: (FuelType data, _) => data.totalSale,
                    pointColorMapper: (FuelType data, index) => colors[index],
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
