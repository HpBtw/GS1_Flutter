import 'package:flutter/material.dart';
import 'package:geoshield/navigation/app_routes.dart';
import 'package:geoshield/ui/screens/dashboard_screen.dart';
import 'package:geoshield/ui/screens/detail_screen.dart';
import 'package:geoshield/ui/screens/intro_screen.dart';
import 'package:geoshield/ui/screens/monitoring_screen.dart';
import 'package:geoshield/ui/screens/register_screen.dart';
import 'package:geoshield/ui/screens/splash_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.intro:
        return MaterialPageRoute(builder: (context) => const IntroScreen());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case AppRoutes.monitoring:
        return MaterialPageRoute(builder: (context) => const MonitoringScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case AppRoutes.detail:
        return MaterialPageRoute(
          builder: (context) => const DetailScreen(),
          settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Rota não encontrada"))));
    }
  }
}
