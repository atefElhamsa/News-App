import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/auth/signup/presentation/controller/sign_up_cubit.dart';
import 'package:news_wave/features/auth/signup/presentation/view/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUPCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SignUpBody(),
      ),
    );
  }
}
