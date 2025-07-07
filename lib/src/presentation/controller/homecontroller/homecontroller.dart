import 'dart:developer';

import 'package:get/get.dart';
import 'package:newsapp/src/data/models/news_model.dart';

import 'package:newsapp/src/data/repositories/newsrepoImpl.dart';
import 'package:newsapp/src/domain/repositories/newsrepo.dart';

class Homecontroller extends GetxController {
  NewsRepo newsRepo = Newsrepoimpl();
  var articles = <Article>[].obs;

  @override
  void onInit() {
    log("initialize Homecontroller()");
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      log("fetch()");
      final res = await newsRepo.fetchNews();
      res.fold(
        (l) {
          log("response failed");
        },
        (R) {
          articles.value = R;
          log("length:${articles.length}");
        },
      );
    } catch (e) {
      log("Error in fetch():$e");
    }
  }
}
