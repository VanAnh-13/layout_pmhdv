import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.of(context).pop();
      },
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
  );
}

Container buildSearchBar() {
  return Container(
    color: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          'https://s1.vnecdn.net/vnexpress/restruct/j/v7073/event/hubxe/images/graphics/v-car.svg',
          height: 20,
          width: 30,
          semanticLabel: 'V-Car Logo',
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

String formatDateTime() {
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