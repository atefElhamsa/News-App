import 'package:dartz/dartz.dart';
import 'package:news_wave/core/errors/failure.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewModel>>> getTopHeadLine({
    required String category,
  });

  Future<Either<Failure, List<NewModel>>> searchForNews({
    required String q,
  });
}
