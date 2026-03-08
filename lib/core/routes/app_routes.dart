import 'package:inseam/features/home/presentation/pages/home_page.dart';
import 'package:inseam/features/measure/presentation/pages/measure_page.dart';
import 'package:inseam/features/settings/presentation/pages/settings_page.dart';
import 'package:inseam/features/sketch/presentation/page/sketch_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const settings = "/settings";
  static const measure = "/measure";
  static const sketch = "/sketch";
  static const addClient = "/add-client";
  static const addTemplate = "/add-template";
  static const newMeasurement = "/new-measurement";
  static const List<Widget> pages = [
    HomePage(),
    MeasurePage(),
    SketchPage(),
    SettingsPage(),
  ];
}
