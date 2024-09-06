class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailureState extends LoginStates {
  final String errorMessage;
  LoginFailureState({
    required this.errorMessage,
  });
}

class LoginSuccessState extends LoginStates {}
