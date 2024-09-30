import 'package:flutter_bloc/flutter_bloc.dart';
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

  addToBookMarks({required NewModel newModel}) {
    bookMarks.add(newModel);
  }

  removeFromBookMarks({required NewModel newModel}) {
    bookMarks.remove(newModel);
  }
}
