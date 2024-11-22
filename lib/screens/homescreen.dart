import 'package:carousel_slider/carousel_slider.dart';
import 'package:clonexaralalmobileapp/screens/courListscreen.dart';
import 'package:clonexaralalmobileapp/widgets/horizontalCardCategory.dart';
import 'package:clonexaralalmobileapp/widgets/textSpanWidget.dart';
import 'package:clonexaralalmobileapp/widgets/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final List<String> imageUrls = [
    'images/mobile_development.svg',
    'images/dev.svg',
    'images/typing.svg',
    'images/react.svg',
    'images/git.svg'
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
                      decoration: BoxDecoration(),
                      child: SvgPicture.asset(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Texttitle(text: "Developpement web et mobile"),
            CourseListScreen(),
          ],
        ),
      ),
    );
  }
}
