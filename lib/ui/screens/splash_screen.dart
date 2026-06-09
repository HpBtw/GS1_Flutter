import 'package:flutter/material.dart';
import 'package:geoshield/navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.intro, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.satellite_alt, size: 100, color: Colors.white),
            SizedBox(height: 24),
            Text(
              "Geoshield",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Prevenção de desastres",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(
              height: 48,
            ),
            CircularProgressIndicator(color: Colors.white)
          ],
        ),
      ),
    );
  }
}
