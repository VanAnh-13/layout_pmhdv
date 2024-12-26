import 'package:flutter/material.dart';
import 'package:layout_pmhdv/tx2/layout/top_car.dart';
import 'package:provider/provider.dart';
import '../../api_response/car_provider.dart';
import 'body.dart';
import 'body_layout.dart';
import 'brand_layout.dart';
import 'common_widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchBar(),
            SizedBox(height: 16),
            CarPriceTableScreen(),
            SizedBox(height: 16),
            CarListScreen(),
            SizedBox(height: 16),
            CarSalesScreen(),
            SizedBox(height: 16),
            BrandLayout(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}