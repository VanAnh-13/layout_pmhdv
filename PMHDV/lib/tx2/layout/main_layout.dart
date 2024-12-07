import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              formatDateTime(),
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
      ),
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Inserted SVG from URL
            SvgPicture.network(
              'https://s1.vnecdn.net/vnexpress/restruct/j/v7073/event/hubxe/images/graphics/v-car.svg',
              height: 20,
              width: 30,
              semanticsLabel: 'V-Car Logo',
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
            SizedBox(width: 8),
            // Search Bar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập tên xe cần tìm, ví dụ Hyundai...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {}, // Implement filter functionality
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 8),
            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Hãng xe", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Phân khúc xe", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Loại xe", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Top doanh số", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Mới ra mắt", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDateTime() {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Chủ nhật',
      'Thứ hai',
      'Thứ ba',
      'Thứ tư',
      'Thứ năm',
      'Thứ sáu',
      'Thứ bảy',
    ];

    String weekday = weekdays[now.weekday % 7];
    String day = now.day.toString().padLeft(2, '0');
    String month = now.month.toString().padLeft(2, '0');
    String year = now.year.toString();

    return '$weekday, $day/$month/$year';
  }
}