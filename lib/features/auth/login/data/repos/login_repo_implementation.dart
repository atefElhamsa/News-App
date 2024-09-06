import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/core/errors/failure.dart';
import 'package:news_wave/features/auth/login/data/repos/login_repo.dart';

class LoginFirebaseImplementation extends LoginRepo {
  @override
  Future<Either<Failure, void>> login(
      {required String email,
      required String pas,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pas,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(
          FirebaseFailure(message: 'user-not-found'),
        );
      } else if (e.code == 'wrong-password') {
        return left(
          FirebaseFailure(message: 'wrong-password'),
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
