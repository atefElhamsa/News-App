import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/presentation/controller/book_mark_cubit/book_mark_states.dart';

class BookMarkCubit extends Cubit<BookMarkStates> {
  BookMarkCubit() : super(BookMarkInitialStates());

  changeBookMark(NewModel newModel) {
    newModel.bookMark = !newModel.bookMark;
    if (newModel.bookMark) {
      addToBookMarks(newModel: newModel);
    } else {
      removeFromBookMarks(newModel: newModel);
    }
    emit(ChangeBookMarksColor());
  }

  List<NewModel> bookMarks = [];
  var box = Hive.box<NewModel>(AppTexts.bookMarkBox);

  addToBookMarks({required NewModel newModel}) async {
    bookMarks.add(newModel);
    await box.put("${newModel.title}${newModel.publishedAt}", newModel);
  }

  removeFromBookMarks({required NewModel newModel}) async {
    bookMarks.remove(newModel);
    await box.delete("${newModel.title}${newModel.publishedAt}");
  }

  fetchBookMarks() {
    bookMarks = box.values.toList();
  }
}
