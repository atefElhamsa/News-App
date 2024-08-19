import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/shared_widgets/custom_field_without_icon.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/core/utils/app_texts.dart';
import 'package:news_wave/features/profile/presentation/view/widgets/select_photo.dart';
import 'package:news_wave/features/splash/presentation/view/splash_screen.dart';

import '../../../../../core/shared_widgets/custom_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SelectPhoto(),
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
            nameForKey: emailAddressKey,
            textEditingController: emailAddressController,
            errorTitle: AppTexts.errorEmail,
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
            nameForKey: phoneNumberKey,
            textEditingController: phoneNumberController,
            errorTitle: AppTexts.errorPhoneNumber,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        CustomButton(
          title: AppTexts.next,
          onPressed: () {
            if (fullNameKey.currentState!.validate() &&
                emailAddressKey.currentState!.validate() &&
                phoneNumberKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SplashScreen();
                }),
              );
            }
          },
        ),
      ],
    );
  }
}
