import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String label;
  final Color backgroundColor;

  const MenuTile({
    super.key,
    required this.iconPath,
    required this.label,
    this.backgroundColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
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
        ),
      ),
    );
  }
}
