abstract class Failure {
  final String message;
  Failure({required this.message});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message});
}
