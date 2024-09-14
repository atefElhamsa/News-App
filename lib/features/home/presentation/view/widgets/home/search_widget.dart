import 'package:flutter/material.dart';
import 'package:news_wave/features/home/presentation/view/search_screen.dart';

import '../../../../../../core/utils/app_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const SearchScreen();
          }),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
          border: Border.all(color: AppColors.mainColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              color: AppColors.mainColor,
              size: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              "Search",
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
