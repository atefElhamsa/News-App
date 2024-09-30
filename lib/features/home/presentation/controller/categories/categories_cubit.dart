import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/presentation/controller/categories/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialStates());

  int categoryIndex = 0;
  changeIndex(int index) {
    categoryIndex = index;
    emit(ChangeColorStates());
  }
}
