import 'package:carousel_slider/carousel_slider.dart';
import 'package:clonexaralalmobileapp/screens/courListscreen.dart';
import 'package:clonexaralalmobileapp/widgets/horizontalCardCategory.dart';
import 'package:clonexaralalmobileapp/widgets/textSpanWidget.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final List<String> imageUrls = [
    'https://via.placeholder.com/600x300.png?text=Image+1',
    'https://via.placeholder.com/600x300.png?text=Image+2',
    'https://via.placeholder.com/600x300.png?text=Image+3',
    'https://via.placeholder.com/600x300.png?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.2,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: TextSpanWidget(
                  normalText: 'Nos catégories ', wordToStyle: 'Phares'),
            ),
            HorizontalScrollCardsWithIcons(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: TextSpanWidget(
                  normalText: 'Selection de  ', wordToStyle: 'Cours'),
            ),
            CourseListScreen(),
          ],
        ),
      ),
    );
  }
}
