import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/utils/app_colors.dart';

class CustomFieldWithIcon extends StatelessWidget {
  const CustomFieldWithIcon({
    super.key,
    required this.title,
    required this.suffixIcon,
    required this.nameForKey,
    required this.textEditingController,
    required this.isHidden,
    required this.errorTitle,
  });

  final String title;
  final String errorTitle;
  final Widget suffixIcon;
  final Key nameForKey;
  final TextEditingController textEditingController;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.field,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            children: [
              TextSpan(
                text: "*",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.astrix,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.002,
        ),
        Form(
          key: nameForKey,
          child: TextFormField(
            obscureText: isHidden,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              enabledBorder: outlineInputBorder(
                context: context,
                borderColor: AppColors.field,
              ),
              focusedBorder: outlineInputBorder(
                context: context,
                borderColor: AppColors.mainColor,
              ),
              errorBorder: outlineInputBorder(
                context: context,
                borderColor: AppColors.red,
              ),
              focusedErrorBorder: outlineInputBorder(
                context: context,
                borderColor: AppColors.mainColor,
              ),
            ),
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(
                FocusNode(),
              );
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: textEditingController,
            validator: (value) {
              if (value == null || value.isEmpty == true) {
                return errorTitle;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder({
    required BuildContext context,
    required Color borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }
}
