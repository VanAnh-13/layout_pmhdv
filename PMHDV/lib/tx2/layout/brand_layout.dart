import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final response = await rootBundle.loadString('assets/sampleData.json');
    final data = json.decode(response) as Map<String, dynamic>;
    final List<CarBrand> carBrands = (data['carBrands'] as List)
        .map((item) => CarBrand.fromJson(item))
        .toList();
    return carBrands;
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
          return GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 10,
            // Number of columns
            childAspectRatio: 1,
            // Width / Height ratio
            children: snapshot.data!.map((carBrand) {
              return InkWell(
                onTap: () => _launchURL(carBrand.link),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      carBrand.photo,
                      height: 10,
                      width: 10,
                      fit: BoxFit.cover,
                      // errorBuilder: (context, error, stackTrace) {
                      //   return Icon(Icons.error);
                      // },
                    ),
                    SizedBox(height: 10),
                    Text(carBrand.name, textAlign: TextAlign.center),
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CarBrand {
  final String name;
  final String photo;
  final String link;

  CarBrand({
    required this.name,
    required this.photo,
    required this.link,
  });

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      name: json['name'],
      photo: json['photo'],
      link: json['link'],
    );
  }
}
