import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/auth/signup/data/repos/signup_repo.dart';
import 'package:news_wave/features/auth/signup/presentation/controller/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitialState());

  final SignUpRepo signUpRepo;

  Future<void> signUpWithFirebase({
    required var emailAddressKay,
    required var passwordKay,
    required var confirmPasswordKay,
    required String passwordText,
    required String confirmPasswordText,
    required String emailAddressText,
  })  async {
    {
      if (emailAddressKay.currentState!.validate() &&
          passwordKay.currentState!.validate() &&
          confirmPasswordKay.currentState!.validate() &&
          passwordText == confirmPasswordText) {
        emit(SignUpLoadingState());
        var result = await signUpRepo.signUp(
          email: emailAddressText,
          pas: passwordText,
        );
        result.fold(
          (l) {
            emit(
              SignUpFailureState(errorMessage: l.message),
            );
          },
          (r) {
            emit(
              SignUpSuccessState(),
            );
          },
        );
      }
    }
  }
}
