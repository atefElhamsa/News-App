import 'package:dartz/dartz.dart';
import 'package:news_wave/core/errors/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, void>> signUp({
    required String email,
    required String pas,
  });
}
