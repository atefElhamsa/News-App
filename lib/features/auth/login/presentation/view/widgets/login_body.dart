import 'package:flutter/material.dart';
import 'package:news_wave/core/shared_widgets/logo_widget.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/auth/login/presentation/view/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LogoWidget(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  MediaQuery.of(context).size.width * 0.22,
                ),
              ),
            ),
            child: const LoginForm(),
          ),
        ),
      ],
    );
  }
}
