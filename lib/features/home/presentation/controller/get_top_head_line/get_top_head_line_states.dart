abstract class GetTopHeadLineStates {}

class GetTopHeadLineInitialStates extends GetTopHeadLineStates {}

class GetTopHeadLineLoadingStates extends GetTopHeadLineStates {}

class GetTopHeadLineFailureStates extends GetTopHeadLineStates {
  final String errorMessage;
  GetTopHeadLineFailureStates({
    required this.errorMessage,
  });
}

class GetTopHeadLineSuccessStates extends GetTopHeadLineStates {}
