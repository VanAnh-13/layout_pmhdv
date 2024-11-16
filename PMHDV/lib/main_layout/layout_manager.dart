import 'package:flutter/material.dart';

import 'left_menu.dart';

class ManageLayout extends StatefulWidget {
  const ManageLayout({super.key});

  @override
  State<ManageLayout> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManageLayout> {
  Widget? _currentContent;

  void setContent(Widget content) {
    setState(() {
      _currentContent = content;
    });
  }

  bool _isLeftMenuVisible = false;

  void _toggleLeftMenu() {
    setState(() {
      _isLeftMenuVisible = !_isLeftMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(_isLeftMenuVisible ? Icons.arrow_back : Icons.menu),
          onPressed: _toggleLeftMenu,
        ),
        if (_isLeftMenuVisible)
          SingleChildScrollView(
            child: Expanded(
              child: LeftMenu(
                onContentChange: setContent,
              ),
            ),
          ),
        Expanded(
          child: _currentContent ?? const Center(child: Text('Select an option from the menu')),
        ),
      ],
    );
  }
}