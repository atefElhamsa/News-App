import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class FaceGoogleLoginWidget extends StatelessWidget {
  const FaceGoogleLoginWidget(
      {super.key, required this.widget, required this.title});

  final Widget widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.faceAndGoogleBorder,
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.width * 0.015,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: AppColors.faceAndGoogleText,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
