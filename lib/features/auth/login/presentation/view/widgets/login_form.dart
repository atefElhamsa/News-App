import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/shared_widgets/custom_button.dart';
import 'package:news_wave/core/shared_widgets/custom_field_with_icon.dart';
import 'package:news_wave/core/shared_widgets/custom_field_without_icon.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/auth/login/presentation/controller/login_cubit.dart';
import 'package:news_wave/features/auth/login/presentation/controller/login_states.dart';
import 'package:news_wave/features/auth/login/presentation/view/widgets/face_or_google_login.dart';
import 'package:news_wave/features/profile/presentation/view/fill_profile_screen.dart';

import '../../../../signup/presentation/view/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool checkBox = false;
  bool passwordIsHidden = true;
  var emailAddressKay = GlobalKey<FormState>();
  var passwordKay = GlobalKey<FormState>();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
  }

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
            title: AppTexts.emailAddress,
            nameForKey: emailAddressKay,
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailAddressController,
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
            isHidden: passwordIsHidden,
            errorTitle: AppTexts.errorPassword,
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
          child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) async {
              if (state is LoginFailureState) {
                AwesomeDialog(
                  context: context,
                  title: state.errorMessage,
                  dialogType: DialogType.error,
                  desc: state.errorMessage == 'user-not-found'
                      ? 'No user found for that email.'
                      : state.errorMessage == 'wrong-password'
                          ? 'Wrong password provided for that user.'
                          : 'Error',
                  descTextStyle: TextStyle(
                    color: AppColors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ).show();
              } else if (state is LoginSuccessState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const FillProfileScreen();
                  }),
                );
              }
            },
            builder: (context, state) {
              return state is LoginLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      title: AppTexts.login,
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).loginWithFirebase(
                          context: context,
                          emailAddressKay: emailAddressKay,
                          passwordKay: passwordKay,
                          passwordText: passwordController.text.trim(),
                          emailAddressText: emailAddressController.text.trim(),
                        );
                      },
                    );
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
