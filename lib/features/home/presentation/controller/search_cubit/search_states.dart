abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}

class SearchLoadingStates extends SearchStates {}

class SearchFailureStates extends SearchStates {
  final String errorMessage;
  SearchFailureStates({
    required this.errorMessage,
  });
}

class SearchSuccessStates extends SearchStates {}
