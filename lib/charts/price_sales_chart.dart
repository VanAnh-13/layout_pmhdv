import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../api_response/price_range.dart';

class PriceSalesChart extends StatefulWidget {
  @override
  _PriceSalesChartState createState() => _PriceSalesChartState();
}

class _PriceSalesChartState extends State<PriceSalesChart> {
  late Future<List<PriceRange>> chartData;

  @override
  void initState() {
    super.initState();
    chartData = _loadData();
  }

  Future<List<PriceRange>> _loadData() async {
    final response = await http.get(
      Uri.parse('https://car-management-1.onrender.com/carmanagement/sale/pricerange'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData.map((item) => PriceRange.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: FutureBuilder<List<PriceRange>>(
          future: chartData,
          builder: (BuildContext context, AsyncSnapshot<List<PriceRange>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return SfCircularChart(
                title: ChartTitle(text: "Number of cars sold by price segment"),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
                series: <CircularSeries<PriceRange, String>>[
                  PieSeries<PriceRange, String>(
                    dataSource: snapshot.data!,
                    xValueMapper: (PriceRange data, _) => data.priceRange,
                    yValueMapper: (PriceRange data, _) => data.totalSale,
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