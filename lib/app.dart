import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Digital Altier',

      theme: AppTheme.light(),


      initialRoute: '/',

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
