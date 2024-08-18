import 'package:flutter/material.dart';
import 'package:news_wave/features/splash/presentation/view/splash_screen.dart';

void main() {
  runApp(const NewsWave());
}

class NewsWave extends StatelessWidget {
  const NewsWave({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
