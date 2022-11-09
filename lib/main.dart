import 'package:flutter/material.dart';

import 'app/app.dart';
import 'routes/routes.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    home: const AppPage(),
    theme: AppTheme.lightTheme,
    routes: Routes.routes,
    onGenerateRoute: Routes.generateRoutes,
  ));
}
