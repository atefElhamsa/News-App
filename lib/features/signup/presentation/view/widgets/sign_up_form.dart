import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/shared_widgets/custom_field_with_icon.dart';
import 'package:news_wave/features/profile/presentation/view/fill_profile_screen.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_field_without_icon.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../auth/login/presentation/view/widgets/face_or_google_login.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool checkBox = false;
  bool passwordIsHidden = true;
  bool confirmPasswordIsHidden = true;

  var userNameKay = GlobalKey<FormState>();

  var passwordKay = GlobalKey<FormState>();
  var confirmPasswordKay = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
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
          child: CustomButton(
            title: AppTexts.signUp,
            onPressed: () {
              if (userNameKay.currentState!.validate() &&
                  passwordKay.currentState!.validate() &&
                  confirmPasswordKay.currentState!.validate() &&
                  passwordController.text.trim() ==
                      confirmPasswordController.text.trim()) {
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
