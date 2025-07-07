import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/core/network/failure.dart';
import 'package:newsapp/src/core/url.dart';
import 'package:newsapp/src/data/models/news_model.dart';
import 'package:newsapp/src/domain/repositories/newsrepo.dart';

class Newsrepoimpl extends NewsRepo {
  @override
  Future<Either<Failure, List<Article>>> fetchNews() async {
    final url = Uri.parse(Url.baseUrl1);

    try {
      log("🌐 Fetching News: $url");
      final response = await http.get(url);
      log("📥 Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final NewsModel newsModel = NewsModel.fromJson(data);
        return Right(newsModel.articles);
      } else {
        return Left(
          Failure(message: "Failed with status: ${response.statusCode}"),
        );
      }
    } catch (e, stack) {
      log("❌ Exception: $e\n$stack");
      return Left(Failure(message: "Exception: $e"));
    }
  }
}
