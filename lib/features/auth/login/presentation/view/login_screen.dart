import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/auth/login/data/repos/login_repo_implementation.dart';
import 'package:news_wave/features/auth/login/presentation/controller/login_cubit.dart';
import 'package:news_wave/features/auth/login/presentation/view/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginRepo: LoginFirebaseImplementation(),
      ),
      child: const Scaffold(
        backgroundColor: AppColors.mainColor,
        body: LoginBody(),
      ),
    );
  }
}
