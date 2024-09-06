import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/core/errors/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, void>> signUp({
    required String email,
    required String pas,
    required BuildContext context,
  });
}
