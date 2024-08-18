import 'package:flutter/material.dart';
import 'package:news_wave/core/shared_widgets/logo_widget.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LogoWidget(),
    );
  }
}