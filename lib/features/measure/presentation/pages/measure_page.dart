
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/navbar_widget.dart';

class MeasurePage extends StatefulWidget {

  const MeasurePage({super.key});

    @override
  State<MeasurePage> createState() => _MeasurePageState();
  }

  class _MeasurePageState extends State<MeasurePage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: Text('INSEAM'),
        ),
        body: Center(
          child: Text('hello from measure', style: AppTextStyles.heading),
        ),

        bottomNavigationBar: NavbarWidget(),
      );
    }
  }