import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFFFFFF);
  static const secondary = Color(0xF1F0E1DE);
  static const accent = Color(0xFF664A16);
  static const button = Color(0xFF667A5E);
  static const inputBg = Color(0xFFE9ECE9);
  // static const button = Color(0xFF163266);
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Colors.black54;
  static const textOnPrimary = Colors.black45;
  static const border = Color(0xFFC8C8C8);
  static const cardBg = Color(0xFFFBF3E1);
  static const cardGradientBg = GradientCombo.coolMist;
  static const cardGradientBg2 = GradientCombo.warmCream;
  static const bg = Color(0xFFFBF7FF);
  static const error = Color(0xFFB3261E);
}

class GradientCombo {
  static const warmCream = LinearGradient(
    colors: [Color(0xFFF5EFE6), Color(0xFFE8DCCB)],
  );
  static const mutedBiege = LinearGradient(
    colors: [Color(0xFFECE6DC), Color(0xFFD8D0C5)],
  );
  static const dustySage = LinearGradient(
    colors: [Color(0xFFDCE3DC), Color(0xFFE9E6E1)],
  );
  static const softMocha = LinearGradient(
    colors: [Color(0xFFE6D8C7), Color(0xFFF3EDE4)],
  );
  static const coolMist = LinearGradient(
    colors: [Color(0xFFE4E8EC), Color(0xFFF1ECE5)],
  );
}
