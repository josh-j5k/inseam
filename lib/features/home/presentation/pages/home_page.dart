import 'package:digital_altier/core/theme/app_text_styles.dart';
import 'package:digital_altier/core/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Digital Altier'),
          ),
          body: Center(
            child: Text('hello from home', style: AppTextStyles.heading),
          ),

      bottomNavigationBar: NavbarWidget(),
        );
  }

}