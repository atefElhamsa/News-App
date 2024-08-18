import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/signup/presentation/view/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SignUpBody(),
    );
  }
}
