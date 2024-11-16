import 'package:flutter/material.dart';

import 'layout_ingredients.dart';
import 'layout_manager.dart';
import '../charts/manage_charts.dart';
import '../charts/monthly_sales_chart.dart';
import '../charts/price_sales_chart.dart';
import '../charts/sales _volume_by_fuel_type.dart';
import '../charts/top_5_best_selling_cars.dart';

/// A widget that represents the left menu with expandable submenus.
class LeftMenu extends StatefulWidget {
  final Function(Widget) onContentChange;

  const LeftMenu({super.key, required this.onContentChange});

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  int? _expandedIndex;

  void _toggleSubMenu(int index) => setState(() {
        if (_expandedIndex == index) {
          _expandedIndex = null;
        } else {
          _expandedIndex = index;
        }
      });

  /// Builds the widget tree for the left menu.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Image.network(
            "https://static-cms-prod.vinfastauto.us/statics/field/image/press-kit/2022/06-01/Vinfast-logo-new_NO_Tagline%20-2D-Horizontal%20black.png",
            width: 100,
            height: 50,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
          ListView(
            shrinkWrap: true,
            children: [
              _buildMenuItem(
                index: 0,
                leadingIcon: Icons.speed,
                title: "Home Screen",
                //               subMenu: _expandedIndex == 0 ? _buildSubMenuControl() : null,
              ),
              _buildMenuItem(
                index: 1,
                leadingIcon: Icons.stacked_bar_chart,
                title: "Manage Charts",
                subMenu: _expandedIndex == 1 ? _buildSubMenuChart() : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required int index,
    required IconData leadingIcon,
    required String title,
    Widget? subMenu,
  }) =>
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.black38,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: ListTile(
              leading: Icon(
                leadingIcon,
                color: Colors.black38,
              ),
              title: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 15, // Set font size to medium
                  ),
                ),
              ),
              onTap: () => {
                if (index == 0)
                  {
                    widget.onContentChange(
                      IngredientsLayout(),
                    ),
                  }
                else if (index == 1)
                  {
                    widget.onContentChange(
                      ManageCharts(),
                    ),
                  },
                _toggleSubMenu(index),
              },
              trailing: Icon(
                _expandedIndex == index ? Icons.expand_less : Icons.expand_more,
                color: Colors.black38,
              ),
            ),
          ),
          if (subMenu != null) subMenu,
        ],
      );

  Widget _buildSubMenuItem(String title, {VoidCallback? onTap}) => ListTile(
        title: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black38,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ),
      );

  Widget _buildSubMenuChart() => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            _buildSubMenuItem("Monthly Sales Chart",
                onTap: () => widget.onContentChange(MonthlySalesChart())),
            _buildSubMenuItem("Price Sales Charts",
                onTap: () => widget.onContentChange(PriceSalesChart())),
            _buildSubMenuItem("Top 5 best-selling cars by region",
                onTap: () => widget.onContentChange(TopBestSelling())),
            _buildSubMenuItem("Sales volume by fuel type",
                onTap: () => widget.onContentChange(SalesVolumeByFuelType())),
          ],
        ),
      );
}
