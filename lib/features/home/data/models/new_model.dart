class NewModel {
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final SourceModel sourceModel;

  NewModel({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.sourceModel,
  });
}

class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    required this.id,
    required this.name,
  });
}
