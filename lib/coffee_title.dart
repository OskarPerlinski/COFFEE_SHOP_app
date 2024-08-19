// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/coffee.dart';

class CoffeeTitle extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onTap;

  // ignore: use_key_in_widget_constructors
  CoffeeTitle({required this.coffee, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, bottom: 25, top: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 130,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  coffee.image,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                coffee.name,
                style:
                    GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Deep Foam",
                style: GoogleFonts.sora(fontSize: 16, color: Colors.grey[500]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + coffee.price,
                    style: GoogleFonts.sora(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: ShapeDecoration(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
