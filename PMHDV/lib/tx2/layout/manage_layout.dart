import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout_pmhdv/tx2/layout/brand_layout.dart';
import 'package:layout_pmhdv/tx2/layout/top_car.dart';

import 'body.dart';
import 'body_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            CarPriceTableScreen(),
            SizedBox(height: 16),
            CarListScreen(),
            SizedBox(height: 16),
            CarSalesScreen(),
            SizedBox(height: 16),
            BrandLayout(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            height: 24,
            semanticsLabel: 'VNExpress Logo',
          ),
          SizedBox(width: 8),
          Text(
            _formatDateTime(),
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.network(
            'https://s1.vnecdn.net/vnexpress/restruct/j/v7073/event/hubxe/images/graphics/v-car.svg',
            height: 20,
            width: 30,
            semanticsLabel: 'V-Car Logo',
            placeholderBuilder: (context) => SizedBox(
              height: 20,
              width: 30,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập tên xe cần tìm, ví dụ Hyundai...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Hãng xe", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Phân khúc xe",
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Loại xe", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Top doanh số",
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child:
                      Text("Mới ra mắt", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime() {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    String weekday = weekdays[now.weekday % 7];
    String day = now.day.toString().padLeft(2, '0');
    String month = now.month.toString().padLeft(2, '0');
    String year = now.year.toString();

    return '$weekday, $day/$month/$year';
  }
}
