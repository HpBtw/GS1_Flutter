import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geoshield/navigation/app_navigation.dart';
import 'package:geoshield/navigation/app_routes.dart';

void main() {
  runApp(GeoShieldApp());
}

class GeoShieldApp extends StatelessWidget {
  const GeoShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.grey),
      scrollBehavior: MouseScrollBehavior(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}

class MouseScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
