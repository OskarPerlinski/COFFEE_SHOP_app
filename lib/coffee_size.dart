import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSize extends StatelessWidget {
  final String coffeeSize;
  final bool isSelected;
  final VoidCallback onTap;
  const CoffeeSize(
      {super.key,
      required this.coffeeSize,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20, right: 22),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey[200] : Colors.white,
            border: Border.all(
                color: isSelected ? Colors.green : Colors.black,
                width: isSelected ? 1 : 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              coffeeSize,
              style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.green : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
