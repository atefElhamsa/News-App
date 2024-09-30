import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/data/repos/home_repo.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_states.dart';

class GetTopHeadLineCubit extends Cubit<GetTopHeadLineStates> {
  GetTopHeadLineCubit({required this.homeRepo})
      : super(GetTopHeadLineInitialStates());
  final HomeRepo homeRepo;
  List<NewModel> topHeadLine = [];
  Map<int, List<NewModel>> mapForNews = {};
  Future<void> getTopHeadLine({
    String category = "technology",
    int index = 0,
    required List<NewModel> bookMarksList,
  }) async {
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
        topHeadLine = topHeadLine.map(
          (newsItem) {
            if (bookMarksList.any((bookMark) => bookMark == newsItem)) {
              newsItem.bookMark = true;
            }
            return newsItem;
          },
        ).toList();
        mapForNews.addAll({index: topHeadLine});
        emit(GetTopHeadLineSuccessStates());
      },
    );
  }
}
