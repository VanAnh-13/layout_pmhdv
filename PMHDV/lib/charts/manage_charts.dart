import 'package:flutter/material.dart';

import 'monthly_sales_chart.dart';
import 'price_sales_chart.dart';
import 'sales _volume_by_fuel_type.dart';
import 'top_5_best_selling_cars.dart';

class ManageCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Manage Charts')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: MonthlySalesChart()),
                Expanded(child: PriceSalesChart()),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 350,
                    child: TopBestSelling(),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 350,
                    child: SalesVolumeByFuelType(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}