import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/src/presentation/controller/homecontroller/homecontroller.dart';
import 'package:newsapp/src/presentation/widgets/menuTile.dart';
import 'package:newsapp/src/presentation/widgets/newsTile.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(Homecontroller());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color(
          0xFF1E3A8A,
        ), // <-- this will color behind the notch!
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Top Menu Bar
                Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 9,
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                  child: Row(
                    children: [
                      MenuTile(
                        onTap: () => log("Menu tapped"),
                        iconPath: "assets/icons/menu.png",
                        label: "News",
                        backgroundColor: const Color(0xffEEF3FD),
                      ),
                      MenuTile(
                        onTap: () => log("Favorites tapped"),
                        iconPath: "assets/icons/fav.png",
                        label: "Fav",
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Articles List
                Obx(() {
                  if (ctrl.articles.isNotEmpty) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ctrl.articles.length,
                      itemBuilder: (context, index) {
                        return Newstile(
                          onTap: () => log("url: ${ctrl.articles[index].url}"),
                          url: ctrl.articles[index].urlToImage ?? '',
                          title: ctrl.articles[index].title ?? '',
                          description: ctrl.articles[index].description ?? '',
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
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
