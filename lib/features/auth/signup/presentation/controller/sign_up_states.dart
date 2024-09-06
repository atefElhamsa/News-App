class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpFailureState extends SignUpStates {
  final String errorMessage;
  SignUpFailureState({
    required this.errorMessage,
  });
}

class SignUpSuccessState extends SignUpStates {}
