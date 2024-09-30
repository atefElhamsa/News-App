import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/categories/categories_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_states.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/list_view_for_categories.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/list_view_for_news.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTopHeadLineCubit>(context).getTopHeadLine(
      category: AppTexts.sport,
      index: 0,
      bookMarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
      ],
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetTopHeadLineCubit>(context).getTopHeadLine(
            category: AppTexts.sport,
            index: 0,
            bookMarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,
          );
        },
        child: Column(
          children: [
            const SearchWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ListViewForCategories(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            BlocConsumer<GetTopHeadLineCubit, GetTopHeadLineStates>(
              listener: (context, state) {
                if (state is GetTopHeadLineFailureStates) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                int key =
                    BlocProvider.of<CategoriesCubit>(context).categoryIndex;
                List<NewModel>? news =
                    BlocProvider.of<GetTopHeadLineCubit>(context)
                        .mapForNews[key];

                return Expanded(
                  child: state is GetTopHeadLineLoadingStates && news == null ||
                          state is GetTopHeadLineLoadingStates && news!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is GetTopHeadLineFailureStates
                          ? Center(
                              child: Column(
                                children: [
                                  const Icon(Icons.error),
                                  Text(state.errorMessage),
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<GetTopHeadLineCubit>(
                                              context)
                                          .getTopHeadLine(
                                        category: AppTexts.sport,
                                        index: 0,
                                        bookMarksList:
                                            BlocProvider.of<BookMarkCubit>(
                                                    context)
                                                .bookMarks,
                                      );
                                    },
                                    child: const Text("Try Again"),
                                  ),
                                ],
                              ),
                            )
                          : ListViewForNews(
                              news: news!,
                            ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
