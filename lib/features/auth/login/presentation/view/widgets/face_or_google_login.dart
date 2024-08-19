import 'package:flutter/material.dart';
import 'package:news_wave/core/shared_widgets/face_google_login_widget.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/core/utils/app_texts.dart';

class FaceOrGoogleLogin extends StatelessWidget {
  const FaceOrGoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FaceGoogleLoginWidget(
          widget: const Icon(
            Icons.facebook_rounded,
            color: AppColors.blue,
          ),
          title: AppTexts.facebook,
          onTap: () {},
        ),
        FaceGoogleLoginWidget(
          widget: Image.asset(
            AppImages.googleIcon,
            fit: BoxFit.cover,
          ),
          title: AppTexts.google,
          onTap: () {},
        ),
      ],
    );
  }
}
