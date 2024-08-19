import 'package:flutter/material.dart';
import 'package:news_wave/features/profile/presentation/view/widgets/fill_profile_body.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FillProfileBody(),
    );
  }
}
