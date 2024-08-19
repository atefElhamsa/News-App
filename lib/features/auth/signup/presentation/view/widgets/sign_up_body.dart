import 'package:flutter/material.dart';
import 'package:news_wave/features/auth/signup/presentation/view/widgets/sign_up_form.dart';

import '../../../../../../core/shared_widgets/logo_widget.dart';
import '../../../../../../core/utils/app_colors.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
            child: const SignUpForm(),
          ),
        ),
      ],
    );
  }
}
