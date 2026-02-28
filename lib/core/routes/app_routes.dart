import 'package:digital_altier/features/home/presentation/pages/home_page.dart';
import 'package:digital_altier/features/measure/presentation/pages/measure_page.dart';
import 'package:digital_altier/features/settings/presentation/pages/settings_page.dart';
import 'package:digital_altier/features/sketch/presentation/page/sketch_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const settings = "/settings";
  static const measure = "/measure";
  static const sketch = "/sketch";
 static const List<Widget> pages = [HomePage(), MeasurePage(), SketchPage(), SettingsPage()];
}