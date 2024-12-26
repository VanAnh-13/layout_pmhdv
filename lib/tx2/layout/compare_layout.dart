import 'package:flutter/material.dart';

import 'carData.dart';
import 'common_widgets.dart';
import 'compare_screen.dart';

class CompareLayout extends StatefulWidget {
  final String imgLink;
  final String carName;
  final String description;
  final List<CarDetails> carDetails;

  CompareLayout({required this.imgLink, required this.carName, required this.description, required this.carDetails});

  @override
  _CompareLayoutState createState() => _CompareLayoutState();
}

class _CompareLayoutState extends State<CompareLayout> {
  DetailCar? cars;
  List<CarDetails> selectedCars = [];

  @override
  void initState() {
    super.initState();
  }

  void handleCarSelect(CarDetails car) {
    if (selectedCars.contains(car)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xe này đã có trong danh sách so sánh.')),
      );

      if (selectedCars.isNotEmpty) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ComparisonScreen(selectedCars: selectedCars);
          },
        );
      }

      return;
    }
    if (selectedCars.length < 4) {
      setState(() {
        selectedCars.add(car);
      });

      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ComparisonScreen(selectedCars: selectedCars);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Chỉ có thể chọn tối đa 4 xe để so sánh.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchBar(),
            SizedBox(height: 16),
            Text(
              widget.carName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
            widget.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.network(
                widget.imgLink,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Các loại xe của hãng Aion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.carDetails.length,
                itemBuilder: (context, index) {
                  return CarCard(car: widget.carDetails[index], onSelect: handleCarSelect);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final CarDetails car;
  final Function(CarDetails) onSelect;

  CarCard({required this.car, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  car.image ?? '',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Khoảng giá: ${car.price}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: ElevatedButton(
              onPressed: () {
                onSelect(car);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle_outline, size: 16),
                  SizedBox(width: 4),
                  Text('So sánh'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComparisonScreen extends StatelessWidget {
  final List<CarDetails> selectedCars;

  ComparisonScreen({required this.selectedCars});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('So sánh xe'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Danh sách so sánh (${selectedCars.length}/4)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedCars.map((car) {
                    return Container(
                      width: 200,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image.network(car.image ?? '',
                                width: 50, height: 50, fit: BoxFit.cover),
                            title: Text(car.name ?? ''),
                            subtitle: Text(
                              'Khoảng giá: ${car.price}',
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                selectedCars.remove(car);
                                Navigator.pop(context);
                                if (selectedCars.isNotEmpty) {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return ComparisonScreen(
                                          selectedCars: selectedCars);
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String carNames = selectedCars.map((car) => car.name).join(',');
                    List<CarData> carDataList = await fetchCarData(carNames);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailsPage(carDataList: carDataList),
                      ),
                    );
                  },
                  child: Text('Compare'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailCar {
  String? name;
  String? img;
  String? description;
  List<CarDetails>? carDetails;

  DetailCar({this.name, this.img, this.description, this.carDetails});

  DetailCar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    description = json['description'];
    if (json['carDetails'] != null) {
      carDetails = <CarDetails>[];
      json['carDetails'].forEach((v) {
        carDetails!.add(new CarDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['description'] = this.description;
    if (this.carDetails != null) {
      data['carDetails'] = this.carDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarDetails {
  String? name;
  String? image;
  String? price;
  String? link;

  CarDetails({this.name, this.image, this.price, this.link});

  CarDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['link'] = this.link;
    return data;
  }
}