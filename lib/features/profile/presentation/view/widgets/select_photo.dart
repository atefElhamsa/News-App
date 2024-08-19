// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';

class SelectPhoto extends StatefulWidget {
  const SelectPhoto({super.key});

  @override
  State<SelectPhoto> createState() => _SelectPhotoState();
}

class _SelectPhotoState extends State<SelectPhoto> {
  final ImagePicker picker = ImagePicker();

  XFile? image;

  pickPhoto(ImageSource imageSource) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.white,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.03,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        pickPhoto(ImageSource.gallery);
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.photo_size_select_actual,
                              size: MediaQuery.of(context).size.height * 0.05,
                              color: AppColors.mainColor,
                            ),
                            Text(
                              AppTexts.gallery,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        pickPhoto(ImageSource.camera);
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: MediaQuery.of(context).size.height * 0.05,
                              color: AppColors.mainColor,
                            ),
                            Text(
                              AppTexts.camera,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.23,
        backgroundColor: AppColors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.21,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.24),
            border: Border.all(
              color: AppColors.mainColor,
            ),
          ),
          child: image == null
              ? Icon(
                  Icons.add_a_photo,
                  color: AppColors.mainColor,
                  size: MediaQuery.of(context).size.height * 0.05,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.23),
                  child: Image.file(
                    File(
                      image!.path,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
