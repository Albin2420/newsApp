import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class News extends StatelessWidget {
  final String url;
  final String title;
  final String content;
  final DateTime dateTime;
  final bool isfav;
  const News({
    super.key,
    required this.content,
    required this.title,
    required this.url,
    required this.dateTime,
    required this.isfav,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    SizedBox(width: 27),
                    SizedBox(
                      height: 12,
                      width: 12,
                      child: Image.asset("assets/icons/back.png"),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Back",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 18,
                      child: SizedBox(
                        height: 26,
                        width: 30,
                        child: isfav == true
                            ? Image.asset("assets/icons/fav.png")
                            : SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset("assets/icons/cal.png"),
                    ),
                    SizedBox(width: 4),
                    Text(
                      formatToGmtStyle(dateTime.toString()),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xffB9B9B9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  content,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatToGmtStyle(String utcString) {
    DateTime utcDateTime = DateTime.parse(
      utcString,
    ).toUtc(); // Ensure it's in UTC

    // Format: "EEE, dd MMM yyyy HH:mm 'GMT'"
    return "${DateFormat("EEE, dd MMM yyyy HH:mm", 'en_US').format(utcDateTime)} GMT";
  }
}
