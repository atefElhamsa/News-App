import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/shared_widgets/custom_field_with_icon.dart';
import 'package:news_wave/features/auth/signup/presentation/controller/sign_up_cubit.dart';
import 'package:news_wave/features/auth/signup/presentation/controller/sign_up_states.dart';

import '../../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../../core/shared_widgets/custom_field_without_icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_texts.dart';
import '../../../../../profile/presentation/view/fill_profile_screen.dart';
import '../../../../login/presentation/view/widgets/face_or_google_login.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool checkBox = false;
  bool passwordIsHidden = true;
  bool confirmPasswordIsHidden = true;

  var emailAddressKay = GlobalKey<FormState>();

  var passwordKay = GlobalKey<FormState>();
  var confirmPasswordKay = GlobalKey<FormState>();

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  OutlineInputBorder outlineInputBorder({
    required BuildContext context,
    required Color borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImages.signUp,
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: AppTexts.confirmPassword,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.field,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: "*",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.astrix,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.002,
              ),
              Form(
                key: confirmPasswordKay,
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: confirmPasswordIsHidden,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmPasswordIsHidden = !confirmPasswordIsHidden;
                        });
                      },
                      icon: confirmPasswordIsHidden
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.mainColor,
                            )
                          : const Icon(
                              Icons.visibility_off_rounded,
                              color: AppColors.mainColor,
                            ),
                    ),
                    enabledBorder: outlineInputBorder(
                      context: context,
                      borderColor: AppColors.field,
                    ),
                    focusedBorder: outlineInputBorder(
                      context: context,
                      borderColor: AppColors.mainColor,
                    ),
                    errorBorder: outlineInputBorder(
                      context: context,
                      borderColor: AppColors.red,
                    ),
                    focusedErrorBorder: outlineInputBorder(
                      context: context,
                      borderColor: AppColors.mainColor,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return AppTexts.errorConfirmPassword;
                    }
                    if (value != passwordController.text) {
                      return AppTexts.errorConfirmPassword;
                    }
                    return null;
                  },
                ),
              ),
            ],
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
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: BlocConsumer<SignUpCubit, SignUpStates>(
            listener: (context, state) async {
              if (state is SignUpFailureState) {
                AwesomeDialog(
                  context: context,
                  title: state.errorMessage,
                  dialogType: DialogType.error,
                  desc: state.errorMessage == 'weak-password'
                      ? 'The password provided is too weak.'
                      : state.errorMessage == 'email-already-in-use'
                          ? 'The account already exists for that email.'
                          : 'Error',
                  descTextStyle: TextStyle(
                    color: AppColors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ).show();
              } else if (state is SignUpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppTexts.userAddSuccess,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    backgroundColor: AppColors.green,
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    closeIconColor: AppColors.white,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                await Future.delayed(
                  const Duration(seconds: 2),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const FillProfileScreen();
                  }),
                );
              }
            },
            builder: (context, state) {
              return state is SignUpLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      title: AppTexts.signUp,
                      onPressed: () {
                        BlocProvider.of<SignUpCubit>(context)
                            .signUpWithFirebase(
                          context: context,
                          emailAddressKay: emailAddressKay,
                          passwordKay: passwordKay,
                          confirmPasswordKay: confirmPasswordKay,
                          passwordText: passwordController.text.trim(),
                          confirmPasswordText:
                              confirmPasswordController.text.trim(),
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
                Navigator.pop(context);
              },
              child: Text(
                AppTexts.login.toLowerCase(),
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
