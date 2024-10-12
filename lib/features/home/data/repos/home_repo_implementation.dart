import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:news_wave/core/errors/failure.dart';
import 'package:news_wave/core/utils/end_points.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/data/repos/home_repo.dart';
import 'package:http/http.dart' as http;

import '../models/source_model.dart';

class HomeRepoImplementationFromApi implements HomeRepo {
  @override
  Future<Either<Failure, List<NewModel>>> getTopHeadLine(
      {required String category}) async {
    List<NewModel> news = [];
    try {
      var response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.getTopHeadlineEndpoint}?apiKey=${EndPoints.apiKey}&category=$category",
        ),
      );
      if (response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
            title: article["title"],
            description: article["description"],
            content: article["content"],
            url: article["url"],
            urlToImage: article["urlToImage"],
            publishedAt: article["publishedAt"],
            sourceModel: SourceModel(
              id: article["source"]["id"],
              name: article["source"]["name"],
            ),
          );
          news.add(newModel);
        }
        return right(news);
      } else {
        return left(
          ApiFailure(message: jsonDecode(response.body)["message"]),
        );
      }
    } catch (e) {
      return left(
        ApiFailure(message: "Oops error occurred!"),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewModel>>> searchForNews(
      {required String q}) async {
    List<NewModel> searchNews = [];
    try {
      var response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.searchAboutNews}?q=$q&apiKey=${EndPoints.apiKey}",
        ),
      );
      if (response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
            title: article["title"],
            description: article["description"],
            content: article["content"],
            url: article["url"],
            urlToImage: article["urlToImage"],
            publishedAt: article["publishedAt"],
            sourceModel: SourceModel(
              id: article["source"]["id"],
              name: article["source"]["name"],
            ),
          );
          searchNews.add(newModel);
        }
        return right(searchNews);
      } else {
        return left(
          ApiFailure(message: jsonDecode(response.body)["message"]),
        );
      }
    } catch (e) {
      return left(
        ApiFailure(message: "Oops error occurred!"),
      );
    }
  }
}
