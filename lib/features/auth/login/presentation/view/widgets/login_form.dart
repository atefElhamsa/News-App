import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/shared_widgets/custom_button.dart';
import 'package:news_wave/core/shared_widgets/custom_field_with_icon.dart';
import 'package:news_wave/core/shared_widgets/custom_field_without_icon.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/auth/login/presentation/view/widgets/face_or_google_login.dart';
import 'package:news_wave/features/profile/presentation/view/fill_profile_screen.dart';
import 'package:news_wave/features/signup/presentation/view/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool checkBox = false;
  bool passwordIsHidden = true;
  var userNameKay = GlobalKey<FormState>();
  var passwordKay = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImages.loginImage,
          width: MediaQuery.of(context).size.width * 0.01,
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: CustomFieldWithoutIcon(
            title: AppTexts.username,
            nameForKey: userNameKay,
            textEditingController: userNameController,
            errorTitle: AppTexts.errorUsername,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: CustomFieldWithIcon(
            title: AppTexts.password,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordIsHidden = !passwordIsHidden;
                });
              },
              icon: passwordIsHidden
                  ? const Icon(
                      Icons.visibility,
                      color: AppColors.mainColor,
                    )
                  : const Icon(
                      Icons.visibility_off_rounded,
                      color: AppColors.mainColor,
                    ),
            ),
            nameForKey: passwordKay,
            textEditingController: passwordController,
            isHidden: passwordIsHidden, errorTitle: AppTexts.errorPassword,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.011),
              child: Checkbox(
                value: checkBox,
                activeColor: AppColors.mainColor,
                onChanged: (value) {
                  setState(() {
                    checkBox = value!;
                  });
                },
              ),
            ),
            Text(
              AppTexts.rememberMe,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: AppColors.field,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppTexts.forgotThePassword,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainColor.withOpacity(0.8),
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: CustomButton(
            title: AppTexts.login,
            onPressed: () {
              if (userNameKay.currentState!.validate() &&
                  passwordKay.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const FillProfileScreen();
                  }),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          AppTexts.orContinueWith,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: AppColors.field,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        const FaceOrGoogleLogin(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.dontHaveAnAccount,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.faceAndGoogleText,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }),
                );
              },
              child: Text(
                AppTexts.signUp,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
