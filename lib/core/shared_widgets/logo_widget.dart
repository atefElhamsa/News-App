import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.splash);
  }
}
