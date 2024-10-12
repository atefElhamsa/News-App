import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_wave/features/home/data/models/source_model.dart';
part 'new_model.g.dart';

@HiveType(typeId: 0)
class NewModel extends Equatable {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? content;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  final String? urlToImage;
  @HiveField(5)
  final String? publishedAt;
  @HiveField(6)
  final SourceModel sourceModel;
  @HiveField(7)
  bool bookMark;

  NewModel({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.sourceModel,
    this.bookMark = false,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        content,
        url,
        urlToImage,
        publishedAt,
        sourceModel,
      ];
}

