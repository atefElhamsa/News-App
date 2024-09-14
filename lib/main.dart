import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/features/profile/presentation/view/fill_profile_screen.dart';
import 'package:news_wave/features/splash/presentation/view/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NewsWave());
}

class NewsWave extends StatelessWidget {
  const NewsWave({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FillProfileScreen(),
    );
  }
}
