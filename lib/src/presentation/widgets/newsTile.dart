import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Newstile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final String url;

  const Newstile({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x2418274B),
              offset: Offset(0, 17.42),
              blurRadius: 85.15,
              spreadRadius: -3.87,
            ),
            BoxShadow(
              color: Color(0x1F18274B),
              offset: Offset(0, 7.74),
              blurRadius: 27.09,
              spreadRadius: -5.81,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 95,
                width: 95,
                child: url.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/icons/placeholder-news.jpg',
                        image: url,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/icons/placeholder-news.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/icons/placeholder-news.jpg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      description,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset("assets/icons/cal.png"),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Mon, 21 Dec 2020 14:57 GMT",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: const Color(0xffB9B9B9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
