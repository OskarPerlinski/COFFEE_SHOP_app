// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/coffee.dart';
import 'package:smart_home/coffee_details_page.dart';
import 'package:smart_home/coffee_title.dart';
import 'package:smart_home/coffee_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List coffeeType = [
    ["All Coffee", true],
    ["Cappucino", false],
    ["Machiato", false],
    ["Late", false]
  ];
  final List coffeSize = [
    ["S", true],
    ["M", false],
    ["L", false]
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }
  


  List coffeeMenu = [
    Coffee(name: "Espresso", price: "2.50", image: "images/coffee10.webp", description: "Espresso is a strong, concentrated coffee made by forcing hot water through finely-ground beans, known for its rich flavor and thick crema."),
    Coffee(name: "Flat White", price: "4.00", image: "images/coffee11.webp", description: "Flat White is an espresso-based drink with steamed milk and a thin layer of microfoam, offering a smooth, rich flavor."),
    Coffee(name: "Cappuccino", price: "4.10", image: "images/coffee12.webp",description: "Cappuccino is a coffee drink made with equal parts espresso, steamed milk, and milk foam. It's known for its rich flavor and thick, frothy top."),
    Coffee(name: "Cortado", price: "5.00", image: "images/coffee13.webp", description: "Cortado is a coffee drink made with equal parts espresso and warm milk, balancing the strong coffee flavor with a smooth, creamy texture."),
    Coffee(name: "Frappe", price: "5.50", image: "images/coffee14.webp", description: "Frappe is a blended iced coffee drink, typically made with instant coffee, water, sugar, and ice, often topped with milk or cream for a frothy texture"),
    Coffee(name: "Iced Latte", price: "5.75", image: "images/coffee15.webp", description: "Iced latte is a cold coffee drink made with espresso and chilled milk, served over ice. It's smooth, refreshing, and less intense than iced coffee."),
  ];
  void navigateToCoffeeDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  CoffeeDetailsPage(
            coffee: coffeeMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style:
                        GoogleFonts.sora(color: Colors.grey[500], fontSize: 14),
                  ),
                  Row(
                    children: [
                      Text(
                        "Poland, Warsaw",
                        style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[500],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      hintText: "Search coffee",
                      hintStyle: GoogleFonts.sora(
                        color: Colors.grey[500],
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                },
              )),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: coffeeMenu.length,
              itemBuilder: (context, index) => CoffeeTitle(
                coffee: coffeeMenu[index],
                onTap: () => navigateToCoffeeDetails(index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
