import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/auth/login/presentation/view/login_screen.dart';
import 'package:news_wave/features/splash/presentation/view/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        navigateToLogin();
      },
    );
  }

  navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
