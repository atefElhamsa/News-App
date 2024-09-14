import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/data/repos/home_repo.dart';
import 'package:news_wave/features/home/presentation/controller/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.homeRepo}) : super(SearchInitialStates());
  final HomeRepo homeRepo;
  List<NewModel> searchNews = [];
  Future<void> getSearch({required String q}) async {
    emit(SearchLoadingStates());
    var result = await homeRepo.searchForNews(q: q);
    result.fold(
      (l) {
        emit(
          SearchFailureStates(errorMessage: l.message),
        );
      },
      (r) {
        searchNews = r;
        emit(SearchSuccessStates());
      },
    );
  }
}
