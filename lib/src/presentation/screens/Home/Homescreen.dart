import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/src/presentation/screens/news/news.dart';
import 'package:newsapp/src/presentation/widgets/menuTile.dart';
import 'package:newsapp/src/presentation/widgets/newsTile.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(18),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 9,
                  bottom: 9,
                ),
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white,
                child: Row(
                  children: [
                    MenuTile(
                      onTap: () {
                        log("call back in menuTile");
                      },
                      iconPath: "assets/icons/menu.png",
                      label: "News",
                      backgroundColor: Color(0xffEEF3FD),
                    ),
                    MenuTile(
                      onTap: () {
                        log("call back in favTile");
                      },
                      iconPath: "assets/icons/fav.png",
                      label: "Fav",
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Newstile(
                onTap: () {
                  log("hehe");
                  Get.to(() => News());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
