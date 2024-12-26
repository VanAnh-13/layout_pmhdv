import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'compare_layout.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class BrandLayout extends StatefulWidget {
  @override
  _BrandLayoutState createState() => _BrandLayoutState();
}

class _BrandLayoutState extends State<BrandLayout> {
  late Future<List<CarBrand>> _carBrandsFuture;

  @override
  void initState() {
    super.initState();
    _carBrandsFuture = fetchCarBrands();
  }

  Future<List<CarBrand>> fetchCarBrands() async {
    final response = await http
        .get(Uri.parse('https://car-management-1.onrender.com/hang-xe'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => CarBrand.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load car brands');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CarBrand>>(
      future: _carBrandsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No car brands available'));
        } else {
          return Container(
            padding: EdgeInsets.all(20),
            child: Container(
              width: 500,
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                children: snapshot.data!.map((carBrand) {
                  return InkWell(
                    onTap: () async {
                      try {
                        final url = Uri.parse(
                            'https://car-management-1.onrender.com/hang-xe/${carBrand.name}');
                        final response = await http.get(url);
                        if (response.statusCode == 200) {
                          final data =
                              json.decode(utf8.decode(response.bodyBytes));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompareLayout(
                                imgLink: data['img'],
                                carName: data['name'],
                                description: data['description'],
                                carDetails: (data['carDetails'] as List<dynamic>)
                                    .map((item) => CarDetails.fromJson(item))
                                    .toList(),
                              ),
                            ),
                          );
                        } else {
                          final errorMessage = response.body.isNotEmpty
                              ? response.body
                              : 'Unknown error';
                          print('Response Error: $errorMessage');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Failed to fetch car details: $errorMessage')),
                          );
                        }
                      } on SocketException {
                        print(
                            'Network error. Please check your internet connection.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Network error. Please check your internet connection.')),
                        );
                      } on FormatException {
                        print('Bad response format.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Bad response format from server.')),
                        );
                      } catch (e) {
                        print('Unexpected error: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('An unexpected error occurred: $e')),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          carBrand.img,
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 10),
                        Text(carBrand.name, textAlign: TextAlign.center),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}

class CarBrand {
  final String name;
  final String img;
  final String link;

  CarBrand({
    required this.name,
    required this.img,
    required this.link,
  });

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      name: json['name'],
      img: json['img'],
      link: json['link'],
    );
  }
}
