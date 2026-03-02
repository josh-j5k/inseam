import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double height;
  const SpacerWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
