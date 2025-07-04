import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Newstile extends StatelessWidget {
  final VoidCallback onTap;
  const Newstile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 17, right: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x2418274B), // #18274B with 0x24 alpha
              offset: Offset(0, 17.42),
              blurRadius: 85.15,
              spreadRadius: -3.87,
            ),
            BoxShadow(
              color: Color(0x1F18274B), // #18274B with 0x1F alpha
              offset: Offset(0, 7.74),
              blurRadius: 27.09,
              spreadRadius: -5.81,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(height: 95, width: 95, color: Colors.amber),
            SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 8, top: 8),
                // color: Colors.yellow,
                child: Column(
                  spacing: 7,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Purus suspendisse adipiscing quam. Varius magnis in nisl.',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),

                    Text(
                      "At leo tellus ornare adipiscing adipiscing pharetra nisi ornare.",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Image.asset("assets/icons/cal.png"),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Mon, 21 Dec 2020 14:57 GMT",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xffB9B9B9),
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
