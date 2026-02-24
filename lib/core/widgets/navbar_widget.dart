import 'package:digital_altier/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  final List<BottomNavigationBarItem> items  =  [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: items,
      backgroundColor: AppColors.bg,
      selectedIconTheme: IconThemeData(fill: 1.0),
      selectedLabelStyle: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),);
  }
}