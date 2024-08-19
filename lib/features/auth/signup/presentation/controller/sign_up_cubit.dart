import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/auth/signup/presentation/controller/sign_up_states.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../profile/presentation/view/fill_profile_screen.dart';

class SignUPCubit extends Cubit<SignUpStates> {
  SignUPCubit() : super(SignUpInitialState());

  signUpWithFirebase({
    required context,
    required var emailAddressKay,
    required var passwordKay,
    required var confirmPasswordKay,
    required String passwordText,
    required String confirmPasswordText,
    required String emailAddressText,
  }) async {
    {
      if (emailAddressKay.currentState!.validate() &&
          passwordKay.currentState!.validate() &&
          confirmPasswordKay.currentState!.validate() &&
          passwordText == confirmPasswordText) {
        emit(SignUpLoadingState());
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailAddressText,
            password: passwordText,
          )
              .then(
            (value) async {
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
            },
          );
          emit(SignUpSuccessState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(SignUpFailureState());
            AwesomeDialog(
              context: context,
              title: 'Password Error',
              dialogType: DialogType.error,
              desc: 'The password provided is too weak.',
              descTextStyle: TextStyle(
                color: AppColors.red,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ).show();
          } else if (e.code == 'email-already-in-use') {
            emit(SignUpFailureState());
            AwesomeDialog(
              context: context,
              title: 'Email Error',
              dialogType: DialogType.error,
              desc: 'The account already exists for that email.',
              descTextStyle: TextStyle(
                color: AppColors.red,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ).show();
          } else {
            emit(SignUpFailureState());
            AwesomeDialog(
              context: context,
              title: 'Error',
              dialogType: DialogType.error,
              desc: e.toString(),
              descTextStyle: TextStyle(
                color: AppColors.red,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ).show();
          }
        } catch (e) {
          emit(SignUpFailureState());
          AwesomeDialog(
            context: context,
            title: 'Error',
            dialogType: DialogType.error,
            desc: e.toString(),
            descTextStyle: TextStyle(
              color: AppColors.red,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ).show();
        }
      }
    }
  }
}
