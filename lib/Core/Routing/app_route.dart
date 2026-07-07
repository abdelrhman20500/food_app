

import 'package:flutter/material.dart';
import 'package:food_app/Core/Routing/routes.dart';
import 'package:food_app/Features/auth/presentation/view/login_view.dart';
import 'package:food_app/Features/auth/presentation/view/sign_up_view.dart';
import 'package:food_app/Features/splash/splash_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.layoutView:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
