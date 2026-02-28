import 'package:digital_altier/core/notifier/route_notifier.dart';
import 'package:digital_altier/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'INSEAM',

      theme: AppTheme.light(),


      // initialRoute: AppRoutes.home,
      // home: AppRoutes.measure,
      home: ValueListenableBuilder(valueListenable: selectedPageIndexNotifier, builder: (context, index, child) {
        return AppRoutes.pages[index];
      }),
      onGenerateRoute: AppRouter.onGenerateRoute,

    );
  }
}
