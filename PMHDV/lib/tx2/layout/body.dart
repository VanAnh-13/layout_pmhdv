import 'package:flutter/material.dart';

class CarPriceTableScreen extends StatelessWidget {
  final List<Map<String, String>> carData = [
    {
      "brand": "Hyundai",
      "model": "i10 2021",
      "variant": "Sedan 1.2 MT tiêu chuẩn",
      "segment": "Xe nhỏ cỡ A",
      "engine": "I4",
      "price": "380 triệu",
      "deal": "Giảm 30-35 triệu đồng bản hatchback, 15 triệu ..."
    },
    {
      "brand": "Hyundai",
      "model": "i10 2021",
      "variant": "1.2 MT",
      "segment": "Xe nhỏ cỡ A",
      "engine": "I4",
      "price": "405 triệu",
      "deal": "Giảm 30-35 triệu đồng bản hatchback, 15 triệu ...",
    },
    {
      "brand": "Hyundai",
      "model": "i10 2021",
      "variant": "Sedan 1.2 MT",
      "segment": "Xe nhỏ cỡ A",
      "engine": "I4",
      "price": "425 triệu",
      "deal": "Giảm 30-35 triệu đồng bản hatchback, 15 triệu ...",
    },
    {
      "brand": "Hyundai",
      "model": "i10 2021",
      "variant": "1.2 AT",
      "segment": "Xe nhỏ cỡ A",
      "engine": "I4",
      "price": "435 triệu",
      "deal": "Giảm 30-35 triệu đồng bản hatchback, 15 triệu ...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Bảng giá xe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String>(
                      hint: Text(
                        "Chọn hãng xe",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: ["Hyundai", "Toyota", "Honda"]
                          .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Hãng xe')),
                        DataColumn(label: Text('Dòng xe')),
                        DataColumn(label: Text('Phiên bản')),
                        DataColumn(label: Text('Phân khúc xe')),
                        DataColumn(label: Text('Động cơ')),
                        DataColumn(label: Text('Giá niêm yết')),
                        DataColumn(label: Text('Đàm phán')),
                      ],
                      rows: carData
                          .map((car) => DataRow(cells: [
                        DataCell(Text(car['brand']!)),
                        DataCell(Text(car['model']!)),
                        DataCell(Text(car['variant']!)),
                        DataCell(Text(car['segment']!)),
                        DataCell(Text(car['engine']!)),
                        DataCell(Text(
                          car['price']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text(car['deal']!)),
                      ]))
                          .toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
