import 'package:dartz/dartz.dart';
import 'package:news_wave/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String pas,
  });
}
