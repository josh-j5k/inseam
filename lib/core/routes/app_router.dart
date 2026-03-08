import 'package:inseam/core/routes/app_routes.dart';
import 'package:inseam/features/home/presentation/pages/add_client_page.dart';
import 'package:inseam/features/measure/presentation/pages/add_template_page.dart';
import 'package:inseam/features/measure/presentation/pages/measure_page.dart';
import 'package:inseam/features/measure/presentation/pages/new_measurement_page.dart';
import 'package:inseam/features/sketch/presentation/page/sketch_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRoutes.measure:
        return MaterialPageRoute(builder: (_) => const MeasurePage());
      case AppRoutes.sketch:
        return MaterialPageRoute(builder: (_) => const SketchPage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case AppRoutes.addClient:
        return MaterialPageRoute(builder: (_) => const AddClientPage());
      case AppRoutes.addTemplate:
        return MaterialPageRoute(builder: (_) => const AddTemplatePage());
      case AppRoutes.newMeasurement:
        return MaterialPageRoute(builder: (_) => const NewMeasurementPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text("Not Found")),
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
