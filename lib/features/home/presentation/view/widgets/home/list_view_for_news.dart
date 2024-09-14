import 'package:flutter/material.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/presentation/view/widgets/home/new_widget.dart';

class ListViewForNews extends StatelessWidget {
  const ListViewForNews({super.key, required this.news});

  final List<NewModel> news;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return NewWidget(newModel: news[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        );
      },
      itemCount: news.length,
    );
  }
}
