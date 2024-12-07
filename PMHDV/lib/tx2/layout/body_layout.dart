import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarListScreen extends StatelessWidget {
  // Mock API data
  Future<List<Map<String, String>>> fetchCarData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API delay
    return [
      {
        "image":
        "https://i1-vnexpress.vnecdn.net/2024/11/28/NissanAlmera2024VnE0jpg-1732766780.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=AkKc06UeoAxfADZjHXFIhQ&t=image",
        "name": "Nissan Almera 2024",
        "releaseDate": "11/2024",
        "price": "Khoảng giá: 489 triệu - 569 triệu",
      },
      {
        "image":
        "https://i1-vnexpress.vnecdn.net/2024/11/26/OmodaC52024VnE5146JPG-1732604559.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=2ABQMXW4spXHVLketMdeDA&t=image",
        "name": "Omoda C5 2024",
        "releaseDate": "11/2024",
        "price": "Khoảng giá: 589 triệu - 669 triệu",
      },
      {
        "image":
        "https://i1-vnexpress.vnecdn.net/2024/11/22/RangeRoverVelarvnexpressJPG-1732262421.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=sVXe-wVyaG35ojhJnJSVkg&t=image",
        "name": "Land Rover Range Rover Velar 2024",
        "releaseDate": "11/2024",
        "price": "Khoảng giá: 3 tỷ 729 triệu",
      },
      {
        "image":
        "https://i1-vnexpress.vnecdn.net/2024/11/11/WulingBingoEVVN270620241989013851719486588jpg-1731298564.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=-DfgGiYTQ-NOY8i67IvadQ&t=image",
        "name": "Wuling Bingo 2024",
        "releaseDate": "11/2024",
        "price": "Khoảng giá: 399 triệu - 469 triệu",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchCarData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error fetching data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No cars found"));
        }

        final carData = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 300, // Set the height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carData.length,
              itemBuilder: (context, index) {
                final car = carData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailScreen(car: car),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              car['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          car['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Thời gian ra mắt: ${car['releaseDate']}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          car['price']!,
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final Map<String, String> car;

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.network(
                car['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              car['name']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Thời gian ra mắt: ${car['releaseDate']}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              car['price']!,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
