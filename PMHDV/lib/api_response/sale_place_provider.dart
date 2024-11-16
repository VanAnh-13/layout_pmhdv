import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fuel_type_provider.dart';
import 'sale_place.dart';

class SalePlaceProvider with ChangeNotifier {
  List<SalePlace> _salePlaces = [];
  bool _isLoading = false;

  List<SalePlace> get salePlaces => _salePlaces;

  bool get isLoading => _isLoading;

  Future<void> fetchSalePlaces(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final url = UriExtensions.buildUri('/carmanagement/sale/saleplace');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse =
            jsonDecode(utf8.decode(response.bodyBytes));
        _salePlaces = jsonResponse
            .map((json) => SalePlace.fromJson(json))
            .toList()
            .cast<SalePlace>();
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
