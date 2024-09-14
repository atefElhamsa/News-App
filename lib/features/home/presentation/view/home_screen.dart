import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_wave/core/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.image});

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AppImages.newsHomeLogo),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: CircleAvatar(
          radius: 100,
          child: Image.file(
            File(image!.path),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
