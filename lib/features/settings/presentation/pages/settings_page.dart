import "package:flutter/material.dart";

import "../../../../core/theme/app_text_styles.dart";
import "../../../../core/widgets/navbar_widget.dart";

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>_SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSEAM'),
      ),
      body: Center(
        child: Text('hello from settings', style: AppTextStyles.heading),
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}