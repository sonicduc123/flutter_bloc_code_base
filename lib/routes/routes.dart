import 'package:flutter/material.dart';

import '../features/features.dart';
import 'routes_name.dart';

class Routes {
  Routes._();

  // map route name with page doesn't have argument
  static final routes = <String, WidgetBuilder>{
    RoutesName.login: (context) => const LoginPage(),
    RoutesName.register: (context) => const RegisterPage(),
    RoutesName.forgetPassword: (context) => const ForgetPasswordPage(),
    RoutesName.profile: (context) => const ProfilePage(),
    RoutesName.changePassword: (context) => const ChangePasswordPage(),
    RoutesName.notify: (context) => const NotifyPage(),
  };

  // map route name with page has argument
  static Route<dynamic>? generateRoutes(settings) {
    dynamic arguments = settings.arguments;
    switch (settings.name) {
      // case RoutesName. :

      //   break;
      default:
    }
  }
}
