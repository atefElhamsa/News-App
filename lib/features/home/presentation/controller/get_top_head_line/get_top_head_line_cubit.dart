import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/data/repos/home_repo.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_states.dart';

class GetTopHeadLineCubit extends Cubit<GetTopHeadLineStates> {
  GetTopHeadLineCubit({required this.homeRepo})
      : super(GetTopHeadLineInitialStates());
  final HomeRepo homeRepo;
  List<NewModel> topHeadLine = [];
  Future<void> getTopHeadLine({String category = "technology"}) async {
    emit(GetTopHeadLineLoadingStates());
    var result = await homeRepo.getTopHeadLine(category: category);
    result.fold(
      (l) {
        emit(
          GetTopHeadLineFailureStates(errorMessage: l.message),
        );
      },
      (r) {
        topHeadLine = r;
        emit(GetTopHeadLineSuccessStates());
      },
    );
  }
}
