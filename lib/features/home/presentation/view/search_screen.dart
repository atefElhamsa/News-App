import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/home/data/repos/home_repo_implementation.dart';
import 'package:news_wave/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/search_cubit/search_states.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/list_view_for_news.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        homeRepo: HomeRepoImplementationFromApi(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: const SearchBody(),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is SearchFailureStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: TextFormField(
                onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).getSearch(
                    q: value.trim(),
                  );
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            Expanded(
              child: state is SearchLoadingStates
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListViewForNews(
                      news: BlocProvider.of<SearchCubit>(context).searchNews,
                    ),
            ),
          ],
        );
      },
    );
  }
}
