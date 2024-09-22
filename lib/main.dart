import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/data/repos/home_repo_implementation.dart';
import 'package:news_wave/features/splash/presentation/view/splash_screen.dart';
import 'features/home/presentation/controller/get_top_head_line/get_top_head_line_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) => GetTopHeadLineCubit(
        homeRepo: HomeRepoImplementationFromApi(),
      ),
      child: const NewsWave(),
    ),
  );
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
