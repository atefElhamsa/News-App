import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_wave/core/errors/failure.dart';
import 'package:news_wave/features/auth/signup/data/repos/signup_repo.dart';

class SignUpFirebaseImplementation extends SignUpRepo {
  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String pas,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pas,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
          FirebaseFailure(message: 'weak-password'),
        );
      } else if (e.code == 'email-already-in-use') {
        return left(
          FirebaseFailure(message: 'email-already-in-use'),
        );
      } else {
        return left(
          FirebaseFailure(message: 'error'),
        );
      }
    } catch (e) {
      return left(
        FirebaseFailure(message: e.toString()),
      );
    }
  }
}
