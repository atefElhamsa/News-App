import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/auth/login/data/repos/login_repo.dart';
import 'package:news_wave/features/auth/login/presentation/controller/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());

  final LoginRepo loginRepo;

  Future<void> loginWithFirebase({
    required context,
    required var emailAddressKay,
    required var passwordKay,
    required String passwordText,
    required String emailAddressText,
  }) async {
    {
      if (emailAddressKay.currentState!.validate() &&
          passwordKay.currentState!.validate()) {
        emit(LoginLoadingState());
        var result = await loginRepo.login(
          context: context,
          email: emailAddressText,
          pas: passwordText,
        );
        result.fold(
          (l) {
            emit(
              LoginFailureState(errorMessage: l.message),
            );
          },
          (r) {
            emit(
              LoginSuccessState(),
            );
          },
        );
      }
    }
  }
}
