// abstact repo
import 'package:newsapp/src/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapp/src/data/models/news_model.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<Article>>> fetchNews();
}
