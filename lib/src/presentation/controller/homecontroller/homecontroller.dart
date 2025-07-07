import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/src/data/models/news_model.dart';

import 'package:newsapp/src/data/repositories/newsrepoImpl.dart';
import 'package:newsapp/src/domain/repositories/newsrepo.dart';

class Homecontroller extends GetxController {
  NewsRepo newsRepo = Newsrepoimpl();
  var articles = <Article>[].obs;
  RxInt currentPage = RxInt(0);
  var fav = <Article>[].obs;
  final pageController = PageController();

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

  void addToFav(dynamic item) {
    fav.add(item);
    log("item count :${fav.length}");
  }

  void pageSwitch({required int pageNo}) {
    try {
      currentPage.value = pageNo;
    } catch (e) {
      log("error in togleOptIon():$e");
    }
  }
}
