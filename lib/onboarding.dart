import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            "images/coffe6.jpg",
            height: 550,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Text(
                "Fall in Love with",
                style: GoogleFonts.sora(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Coffee in  Blissful",
                style: GoogleFonts.sora(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text("Delight!",
                  style: GoogleFonts.sora(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to our cozy coffee corner, where",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                "every cup is a delightful for you.",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC67C4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.sora(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
