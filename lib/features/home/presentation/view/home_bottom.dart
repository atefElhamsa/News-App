import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/features/home/data/repos/home_repo_implementation.dart';
import 'package:news_wave/features/home/presentation/controller/get_top_head_line/get_top_head_line_cubit.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/home_screen.dart';

class HomeBottom extends StatefulWidget {
  HomeBottom({super.key, required this.image});

  XFile? image;

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  int currentIndex = 0;

  final List<Widget> screensHome = [
    const HomeScreen(),
    const Icon(Icons.delete),
    const Icon(Icons.foggy),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTopHeadLineCubit(
        homeRepo: HomeRepoImplementationFromApi(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(AppImages.newsHomeLogo),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.1,
              backgroundImage: Image.file(
                File(widget.image!.path),
                fit: BoxFit.cover,
              ).image,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.sliders),
              label: "Topics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded),
              label: "Bookmark",
            ),
          ],
        ),
        body: screensHome[currentIndex],
      ),
    );
  }
}
