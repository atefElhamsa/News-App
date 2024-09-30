// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_wave/core/shared_widgets/custom_field_without_icon.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../home/presentation/view/home_bottom.dart';

class FillProfileBody extends StatefulWidget {
  const FillProfileBody({super.key});

  @override
  State<FillProfileBody> createState() => _FillProfileBodyState();
}

class _FillProfileBodyState extends State<FillProfileBody> {
  var fullNameKey = GlobalKey<FormState>();
  var emailAddressKey = GlobalKey<FormState>();
  var phoneNumberKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var emailNode = FocusNode();
  var phoneNode = FocusNode();

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
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: Text(
              AppTexts.fillYourProfile,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
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
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
                                    color: AppColors.mainColor,
                                  ),
                                  Text(
                                    AppTexts.gallery,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
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
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
                                    color: AppColors.mainColor,
                                  ),
                                  Text(
                                    AppTexts.camera,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
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
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.24),
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CustomFieldWithoutIcon(
              title: AppTexts.fullName,
              nameForKey: fullNameKey,
              textEditingController: fullNameController,
              errorTitle: AppTexts.errorUsername,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(
                  emailNode,
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CustomFieldWithoutIcon(
              title: AppTexts.emailAddress,
              focusNode: emailNode,
              keyboardType: TextInputType.emailAddress,
              nameForKey: emailAddressKey,
              textEditingController: emailAddressController,
              errorTitle: AppTexts.errorEmail,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(
                  phoneNode,
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CustomFieldWithoutIcon(
              title: AppTexts.phoneNumber,
              focusNode: phoneNode,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(
                  FocusNode(),
                );
              },
              nameForKey: phoneNumberKey,
              keyboardType: TextInputType.phone,
              textEditingController: phoneNumberController,
              errorTitle: AppTexts.errorPhoneNumber,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CustomButton(
              title: AppTexts.next,
              onPressed: () {
                if (fullNameKey.currentState!.validate() &&
                    emailAddressKey.currentState!.validate() &&
                    phoneNumberKey.currentState!.validate()) {
                  if (image == null) {
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
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          color: AppColors.mainColor,
                                        ),
                                        Text(
                                          AppTexts.gallery,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
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
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          color: AppColors.mainColor,
                                        ),
                                        Text(
                                          AppTexts.camera,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
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
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomeBottom(
                          image: image,
                        );
                      }),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
