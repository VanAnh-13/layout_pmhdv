import 'package:flutter/material.dart';
import 'package:layout_pmhdv/api_response/sale_place.dart';
import 'package:layout_pmhdv/api_response/sale_place_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopBestSelling extends StatefulWidget {
  const TopBestSelling({Key? key}) : super(key: key);

  @override
  _TopBestSellingState createState() => _TopBestSellingState();
}

class _TopBestSellingState extends State<TopBestSelling> {
  @override
  void initState() {
    super.initState();
    Provider.of<SalePlaceProvider>(context, listen: false)
        .fetchSalePlaces(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SalePlaceProvider>(
        builder: (context, salePlaceProvider, child) {
          if (salePlaceProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (salePlaceProvider.salePlaces.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: salePlaceProvider.salePlaces.length,
              itemBuilder: (context, index) {
                final salePlace = salePlaceProvider.salePlaces[index];
                return Center(
                  child: ChartWidget(chartData: {
                    'brand': salePlace.companyAndName,
                    'data': salePlace.data,
                  }),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  final Map<String, dynamic> chartData;

  const ChartWidget({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Expanded(
          child: SfCartesianChart(
            title: ChartTitle(text: chartData['brand'] ?? 'Unknown'),
            primaryXAxis: CategoryAxis(),
            series: <BarSeries<dynamic, String>>[
              BarSeries<RegionData, String>(
                dataSource: chartData['data'],
                xValueMapper: (RegionData data, _) => data.region,
                yValueMapper: (RegionData data, _) => data.sales,
                width: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
