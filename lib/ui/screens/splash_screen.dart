import 'package:flutter/material.dart';
import 'package:geoshield/navigation/app_routes.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 6767), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.intro, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Lottie.asset('assets/satelite_animation.json'),
              height: 400,
              width: 400,
            ),
            const SizedBox(height: 24),
            const Text(
              "Geoshield",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Prevenção de desastres",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(
              height: 48,
            ),
            const CircularProgressIndicator(color: Colors.white)
          ],
        ),
      ),
    );
  }
}
