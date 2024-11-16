import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'price_range.dart';

class PriceRangeProvider with ChangeNotifier {
  List<PriceRange> _priceRanges = [];
  bool _isLoading = false;
  String? _error;

  List<PriceRange> get priceRanges => _priceRanges;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> fetchPriceRanges() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
            'https://car-management-1.onrender.com/carmanagement/sale/pricerange'),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(utf8.decode(response.bodyBytes));
        _priceRanges =
            jsonData.map((data) => PriceRange.fromJson(data)).toList();
      } else {
        _error = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
