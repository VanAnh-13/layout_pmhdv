import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../api_response/monthly_sale.dart';
import '../api_response/monthly_sales_chart_provider.dart';

class MonthlySalesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MonthlySalesChartProvider(),
      child: MonthlySalesChartView(),
    );
  }
}

class MonthlySalesChartView extends StatefulWidget {
  @override
  State<MonthlySalesChartView> createState() => _MonthlySalesChartViewState();
}

class _MonthlySalesChartViewState extends State<MonthlySalesChartView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
      Provider.of<MonthlySalesChartProvider>(context, listen: false);
      provider.fetchSalesData(1); // Set default month to 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MonthlySalesChartProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildMonthDropdown(provider),
                const SizedBox(height: 20),
                if (provider.error != null)
                  Text(
                    provider.error!,
                    style: const TextStyle(color: Colors.red),
                  )
                else if (provider.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  _buildChartContainer(provider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMonthDropdown(MonthlySalesChartProvider provider) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<int>(
          value: provider.selectedMonth,
          isExpanded: true,
          underline: const SizedBox.shrink(),
          items: provider.months.map((month) {
            return DropdownMenuItem<int>(
              value: month['value'],
              child: Text(month['label']),
            );
          }).toList(),
          onChanged: (int? month) {
            if (month != null) {
              provider.updateSelectedMonth(month);
            }
          },
        ),
      ),
    );
  }

  Widget _buildChartContainer(MonthlySalesChartProvider provider) {
    if (provider.salesData.isEmpty) {
      return const Center(
        child: Text('No data available for the selected month.'),
      );
    }

    // Calculate max value for Y-axis
    final maxSales = provider.salesData
        .map((data) => data.totalSale)
        .reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 400, // Fixed height for the chart
        width: 70.0 * provider.salesData.length, // Dynamic width based on the number of items
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
              text: 'Companies (Month ${provider.selectedMonth})',
            ),
            labelRotation: 45,
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: (maxSales * 1.2).ceilToDouble(),
            interval: (maxSales / 5).ceilToDouble(),
          ),
          series: <CartesianSeries<dynamic, dynamic>>[
            ColumnSeries<CarSalesData, String>(
              dataSource: provider.salesData,
              xValueMapper: (CarSalesData sales, _) => sales.company,
              yValueMapper: (CarSalesData sales, _) => sales.totalSale,
              color: const Color(0xFF00BCD4),
              width: 0.6,
              spacing: 0.2,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
              ),
              animationDuration: 1000,
            ),
          ],
          tooltipBehavior: TooltipBehavior(
            enable: true,
            builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
              final sales = data as CarSalesData;
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text('${sales.company}: ${sales.totalSale} units',
                    style: const TextStyle(color: Colors.black)),
              );
            },
          ),
        ),
      ),
    );
  }
}