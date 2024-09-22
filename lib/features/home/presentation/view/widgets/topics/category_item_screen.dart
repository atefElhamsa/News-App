import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/data/models/category_model.dart';

import '../../../controller/get_top_head_line/get_top_head_line_cubit.dart';
import '../../../controller/get_top_head_line/get_top_head_line_states.dart';
import '../home/list_view_for_news.dart';

class CategoryItemScreen extends StatefulWidget {
  const CategoryItemScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTopHeadLineCubit>(context)
        .getTopHeadLine(category: widget.categoryModel.name);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetTopHeadLineCubit>(context)
            .getTopHeadLine(category: widget.categoryModel.name);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryModel.name),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            children: [
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
                  return Expanded(
                    child: state is GetTopHeadLineLoadingStates
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
                                        BlocProvider.of<GetTopHeadLineCubit>(context)
                                            .getTopHeadLine(
                                          category: widget.categoryModel.name,
                                        );
                                      },
                                      child: const Text("Try Again"),
                                    ),
                                  ],
                                ),
                              )
                            : ListViewForNews(
                                news: BlocProvider.of<GetTopHeadLineCubit>(context)
                                    .topHeadLine),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
