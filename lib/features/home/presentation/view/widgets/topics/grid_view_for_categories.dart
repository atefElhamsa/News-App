import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/home/data/models/category_model.dart';
import 'package:news_wave/features/home/presentation/view/widgets/topics/category_item_screen.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';

class GridViewForCategories extends StatelessWidget {
  GridViewForCategories({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(name: AppTexts.technology, img: AppImages.technology),
    CategoryModel(name: AppTexts.sport, img: AppImages.sport),
    CategoryModel(name: AppTexts.business, img: AppImages.business),
    CategoryModel(name: AppTexts.science, img: AppImages.science),
    CategoryModel(name: AppTexts.general, img: AppImages.general),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CategoryItemScreen(categoryModel: categories[index]);
              }),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.03),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.03),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.03),
                  ),
                  child: Image.asset(categories[index].img),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    categories[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: categories.length,
    );
  }
}
