// ignore_for_file: sized_box_for_whitespace

import 'package:coffeeapp/ultil/coffee_title.dart';
import 'package:coffeeapp/ultil/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List Coffee Type
  final List coffeeTypes = [
    [
      'Cappucino',
      false,
    ],
    [
      'Late',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Other',
      false,
    ],
  ];
  // Coffee Type Selected
  void coffeeTypeSelected(int index) {
    setState(() {
      coffeeTypes[index][1] = !coffeeTypes[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Find the best coffee for you
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Find the best coffee for you',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 56,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Find your coffee',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Container(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: coffeeTypes.length,
                      itemBuilder: ((context, index) {
                        return CoffeeType(
                          coffeeType: coffeeTypes[index][0],
                          isSelected: coffeeTypes[index][1],
                          onTap: () {
                            coffeeTypeSelected(index);
                          },
                        );
                      }))),
              Container(
                height: 340,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    CoffeeTitle(
                      coffeeImagePath: 'assets/cappucino.png',
                      coffeeName: 'Cappucino',
                      coffeeDescription: 'Art of Coffee',
                      coffeePrice: '4.00',
                    ),
                    CoffeeTitle(
                      coffeeImagePath: 'assets/late.png',
                      coffeeName: 'Late',
                      coffeeDescription: 'Art of Coffee',
                      coffeePrice: '3.50',
                    ),
                    CoffeeTitle(
                      coffeeImagePath: 'assets/milk.png',
                      coffeeName: 'Milk',
                      coffeeDescription: 'Art of Coffee',
                      coffeePrice: '3.00',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
