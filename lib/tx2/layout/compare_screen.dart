import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'carData.dart';

Future<List<CarData>> fetchCarData(String name) async {
  final response = await http.get(
    Uri.parse('https://car-management-1.onrender.com/car/so-sanh?names=$name'),
    headers: {'Content-Type': 'application/json; charset=utf-8'},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes));
    return jsonList.map((json) => CarData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load car data');
  }
}

class CarDetailsTable extends StatelessWidget {
  final List<CarData> carDataList;

  CarDetailsTable({required this.carDataList});

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      DataColumn(label: Text('Argument')),
    ];

    for (var carData in carDataList) {
      columns.add(DataColumn(label: Text(carData.name ?? 'Unknown')));
    }

    List<DataRow> rows = [];

    Set<String> keys = {};
    for (var carData in carDataList) {
      keys.addAll(carData.toJson().keys);
    }

    for (var key in keys) {
      if (key != 'name' && key != 'sales' && key != 'image' && key != 'id') {
        List<DataCell> cells = [DataCell(Text(key))];
        for (var carData in carDataList) {
          cells.add(DataCell(Text(carData.toJson()[key]?.toString() ?? '')));
        }
        rows.add(DataRow(cells: cells));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: columns,
            rows: rows,
          ),
        ),
      ),
    );
  }
}

class CarDetailsPage extends StatefulWidget {
  final List<CarData> carDataList;

  CarDetailsPage({required this.carDataList});

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  late List<CarData> _carData;

  @override
  void initState() {
    super.initState();
    _carData = widget.carDataList;
  }

  @override
  Widget build(BuildContext context) {
    if (_carData.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(child: CarDetailsTable(carDataList: _carData));
    }
  }
}
