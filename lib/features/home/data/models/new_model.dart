import 'package:equatable/equatable.dart';

class NewModel extends Equatable {
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final SourceModel sourceModel;
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

class SourceModel extends Equatable {
  final String? id;
  final String? name;

  const SourceModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
