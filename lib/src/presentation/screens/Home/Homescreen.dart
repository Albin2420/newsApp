import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/src/presentation/controller/homecontroller/homecontroller.dart';
import 'package:newsapp/src/presentation/screens/news/news.dart';
import 'package:newsapp/src/presentation/widgets/menuTile.dart';
import 'package:newsapp/src/presentation/widgets/newsTile.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(Homecontroller());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: const Color(0xFF1E3A8A),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: Column(
            children: [
              // Top Menu Bar
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 9),
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white,
                child: Row(
                  children: [
                    MenuTile(
                      index: 0,
                      onTap: () {
                        ctrl.pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      iconPath: "assets/icons/menu.png",
                      label: "News",
                    ),
                    MenuTile(
                      index: 1,
                      onTap: () {
                        ctrl.pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      iconPath: "assets/icons/fav.png",
                      label: "Fav",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // PageView with News & Fav
              Expanded(
                child: PageView.builder(
                  controller: ctrl.pageController,
                  onPageChanged: (index) {
                    ctrl.pageSwitch(pageNo: index);
                  },
                  itemCount: 2,
                  itemBuilder: (context, pageIndex) {
                    if (pageIndex == 0) {
                      // News Page
                      return Obx(() {
                        if (ctrl.articles.isNotEmpty) {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            itemCount: ctrl.articles.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(
                                  ctrl.articles[index].url ?? index.toString(),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  ctrl.addToFav(ctrl.articles[index]);
                                  ctrl.articles.removeAt(index);
                                },
                                background: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFCD1D1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 27,
                                        width: 24,
                                        child: Image.asset(
                                          "assets/icons/fav.png",
                                        ),
                                      ),
                                      Text(
                                        "Add to \nFavorite",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                child: Newstile(
                                  onTap: () => Get.to(() => const News()),
                                  url: ctrl.articles[index].urlToImage ?? '',
                                  title: ctrl.articles[index].title ?? '',
                                  description:
                                      ctrl.articles[index].description ?? '',
                                  publishDate:
                                      ctrl.articles[index].publishedAt!,
                                  index: index,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 24),
                          );
                        } else {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 32.0),
                              child: Text(
                                'No articles available',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }
                      });
                    } else {
                      return Obx(() {
                        if (ctrl.fav.isEmpty) {
                          return Center(
                            child: Text(
                              "No articles available",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return Newstile(
                                onTap: () {},
                                title: ctrl.fav[index].title!,
                                description: ctrl.fav[index].description!,
                                url: ctrl.fav[index].urlToImage!,
                                publishDate: ctrl.fav[index].publishedAt!,
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 24);
                            },
                            itemCount: ctrl.fav.length,
                          );
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
