
import 'package:digital_altier/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/navbar_widget.dart';

class SketchPage extends StatefulWidget {
  const SketchPage({super.key});
  
  @override
  State<SketchPage> createState() => _SketchPageState();
}

class _SketchPageState extends State<SketchPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSEAM'),
      ),
      body: Center(
        child: Text('hello from home', style: AppTextStyles.heading),
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}