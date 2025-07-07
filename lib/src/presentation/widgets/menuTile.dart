import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/src/presentation/controller/homecontroller/homecontroller.dart';

class MenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String label;
  final int index;

  const MenuTile({
    super.key,
    required this.iconPath,
    required this.label,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<Homecontroller>();
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Obx(() {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: menuController.currentPage.value == index
                  ? Color(0xffEEF3FD)
                  : Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(iconPath, height: 33, width: 23),
                const SizedBox(width: 20),
                Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
