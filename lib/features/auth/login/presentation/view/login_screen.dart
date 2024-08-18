import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/auth/login/presentation/view/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColor,
      body: LoginBody(),
    );
  }
}
