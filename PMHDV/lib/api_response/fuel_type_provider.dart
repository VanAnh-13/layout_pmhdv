import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fuel_type.dart';

class FuelTypeProvider with ChangeNotifier {
  List<FuelType> _fuelTypes = [];
  bool _isLoading = false;

  List<FuelType> get fuelTypes => _fuelTypes;

  bool get isLoading => _isLoading;

  Future<void> fetchFuelTypes(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final url = UriExtensions.buildUri('/carmanagement/sale/salefuel');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse =
            jsonDecode(utf8.decode(response.bodyBytes));
        _fuelTypes = jsonResponse
            .map((json) => FuelType.fromJson(json))
            .toList()
            .cast<FuelType>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.statusCode}'),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
        ),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}

extension UriExtensions on Uri {
  static Uri buildUri(String path, [Map<String, String>? queryParameters]) {
    return Uri.https('car-management-1.onrender.com', path, queryParameters);
  }
}
