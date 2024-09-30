import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_wave/core/errors/failure.dart';
import 'package:news_wave/features/auth/login/data/repos/login_repo.dart';

class LoginFirebaseImplementation extends LoginRepo {
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String pas,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: pas.trim(),
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(
          FirebaseFailure(message: 'Error'),
        );
      } else if (e.code == 'wrong-password') {
        return left(
          FirebaseFailure(message: 'Error'),
        );
      } else {
        return left(
          FirebaseFailure(message: 'Error'),
        );
      }
    } catch (e) {
      return left(
        FirebaseFailure(message: e.toString()),
      );
    }
  }
}
