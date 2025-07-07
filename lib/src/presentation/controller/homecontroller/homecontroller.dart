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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
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

  // Add this method to handle navigation safely
  void navigateToPage(int pageIndex) {
    try {
      log("navigateToPage: $pageIndex");

      // Check if pageController is attached to a PageView
      if (pageController.hasClients) {
        currentPage.value = pageIndex;
        pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        log("PageController not attached yet, using delayed navigation");
        // If not attached, wait for next frame and try again
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pageController.hasClients) {
            pageController.animateToPage(
              pageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            currentPage.value = pageIndex;
          } else {
            // Fallback: just update the current page
            currentPage.value = pageIndex;
          }
        });
      }
    } catch (e) {
      log("Error in navigateToPage(): $e");
      // Fallback: just update the current page
      currentPage.value = pageIndex;
    }
  }
}
