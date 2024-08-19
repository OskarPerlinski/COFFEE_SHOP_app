// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/coffee.dart';
import 'package:smart_home/coffee_size.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailsPage({
    super.key,
    required this.coffee,
  });

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  final List coffeSize = [
    ["S", true],
    ["M", false],
    ["L", false]
  ];
  void coffeeSizeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeSize.length; i++) {
        coffeSize[i][1] = false;
      }
      coffeSize[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail",
          style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 30.0,
            ),
            child: Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(widget.coffee.image),
              ),
              const SizedBox(height: 20),
              Text(
                widget.coffee.name,
                style:
                    GoogleFonts.sora(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Ice/Hot",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.black45),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.star_sharp,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "4.8",
                    style: GoogleFonts.sora(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "(230)",
                    style:
                        GoogleFonts.sora(fontSize: 10, color: Colors.black45),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Divider(),
              ),
              const SizedBox(height: 10),
              Text(
                "Description",
                style:
                    GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.coffee.description,
                style: GoogleFonts.sora(fontSize: 14, color: Colors.black45),
              ),
              const SizedBox(height: 20),
              Text(
                "Size",
                style:
                    GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeSize.length,
                  itemBuilder: (context, index) {
                    return CoffeeSize(
                      coffeeSize: coffeSize[index][0],
                      isSelected: coffeSize[index][1],
                      onTap: () {
                        coffeeSizeSelected(index);
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Divider(),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: GoogleFonts.sora(
                              fontSize: 14, color: Colors.black45),
                        ),
                        Text(
                          "\$ " + widget.coffee.price,
                          style: GoogleFonts.sora(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC67C4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.sora(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
