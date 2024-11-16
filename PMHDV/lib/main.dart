import 'package:flutter/material.dart';
import 'package:layout_pmhdv/api_response/monthly_sales_chart_provider.dart';
import 'package:provider/provider.dart';

import 'api_response/car_provider.dart';
import 'api_response/fuel_type_provider.dart';
import 'api_response/sale_place_provider.dart';
import 'main_layout/layout_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Disable web image decoding
  PaintingBinding.instance.imageCache.clear();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SalePlaceProvider()),
        ChangeNotifierProvider(create: (_) => FuelTypeProvider()),
        ChangeNotifierProvider(create: (_) => MonthlySalesChartProvider()),
        ChangeNotifierProvider(create: (_) => CarProvider()),
      ],
      child: const MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: ManageLayout(),
          ),
        ),
      ),
    ),
  );
}
// flutter run -d chrome --web-browser-flag "--disable-web-security"
