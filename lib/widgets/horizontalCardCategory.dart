import 'package:clonexaralalmobileapp/const.dart';
import 'package:flutter/material.dart';

class HorizontalScrollCardsWithIcons extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.code, "text": "Developpement web et mobile"},
    {"icon": Icons.design_services, "text": "Design"},
    {"icon": Icons.campaign, "text": "Marketing et Communication"},
    {"icon": Icons.computer, "text": "Reseau systeme et Securite"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2, // Hauteur des cartes
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
               
                // color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.5, // Largeur des cartes
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        items[index]["icon"],
                        size: 40,
                        color: secondaryColor,
                      ),
                      SizedBox(height: 10),
                      Text(
                        items[index]["text"],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
