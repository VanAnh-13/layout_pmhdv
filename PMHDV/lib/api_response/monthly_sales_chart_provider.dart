import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fuel_type_provider.dart';
import 'monthly_sale.dart';

class MonthlySalesChartProvider with ChangeNotifier {
  List<CarSalesData> _salesData = [];
  bool _isLoading = false;
  String? _error;
  int _selectedMonth = 1;

  // Getters
  List<CarSalesData> get salesData => _salesData;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get selectedMonth => _selectedMonth;

  final List<Map<String, dynamic>> months = List.generate(
    12,
    (index) => {
      'value': index + 1,
      'label': 'Tháng ${index + 1}',
    },
  );

  Future<void> fetchSalesData(int month) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        UriExtensions.buildUri(
            '/carmanagement/sale/topmonth', {'month': '$month'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        _salesData =
            jsonData.map((data) => CarSalesData.fromJson(data)).toList();
        _selectedMonth = month;
        _isLoading = false;
        notifyListeners();
      } else {
        _error = 'Failed to load data: ${response.statusCode}';
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _error = 'Error: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateSelectedMonth(int month) {
    fetchSalesData(month);
  }
}
