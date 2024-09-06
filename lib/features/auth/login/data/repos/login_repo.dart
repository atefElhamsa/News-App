import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String pas,
    required BuildContext context,
  });
}
