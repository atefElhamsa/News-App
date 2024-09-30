import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/home/data/models/category_model.dart';
import 'package:news_wave/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/categories/categories_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/categories/categories_states.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_cubit.dart';

class ListViewForCategories extends StatelessWidget {
  ListViewForCategories({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(name: AppTexts.sport),
    CategoryModel(name: AppTexts.technology),
    CategoryModel(name: AppTexts.business),
    CategoryModel(name: AppTexts.general),
    CategoryModel(name: AppTexts.science),
    CategoryModel(name: AppTexts.entertainment),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryWidget(
            index: index,
            categoryModel: categories[index],
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.index, required this.categoryModel});

  final int index;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<CategoriesCubit>(context).changeIndex(index);
            BlocProvider.of<GetTopHeadLineCubit>(context).getTopHeadLine(
              bookMarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,
              category: categoryModel.name,
              index: index,
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(
                  MediaQuery.of(context).size.width * 0.05),
              color: BlocProvider.of<CategoriesCubit>(context).categoryIndex ==
                      index
                  ? AppColors.mainColor
                  : AppColors.white,
            ),
            child: Text(
              categoryModel.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                color:
                    BlocProvider.of<CategoriesCubit>(context).categoryIndex ==
                            index
                        ? AppColors.white
                        : AppColors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
