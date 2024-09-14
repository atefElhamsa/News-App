import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_states.dart';
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
      category: "technology",
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetTopHeadLineCubit>(context).getTopHeadLine(
          category: "technology",
        );
      },
      child: Column(
        children: [
          const SearchWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
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
                                    BlocProvider.of<GetTopHeadLineCubit>(
                                            context)
                                        .getTopHeadLine(
                                      category: "technology",
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
    );
  }
}
