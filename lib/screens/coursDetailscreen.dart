import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/data/models/course.dart';
import 'package:clonexaralalmobileapp/screens/tabWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursDetailscreen extends StatefulWidget {
  const CoursDetailscreen({super.key, required this.course});
  final Course course;
  @override
  State<CoursDetailscreen> createState() => _CoursDetailscreenState();
}

class _CoursDetailscreenState extends State<CoursDetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        widget.course.imagePath,
                        fit: BoxFit.contain,
                        width: 150,
                        height: 100,
                      ),
                    ),
                    // Texte (titre et instructeur)
                    SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.course.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.course.instructor,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.course.language,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                widget.course.coursTatuts,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: greenColor,
                                ),
                              ),
                              TextButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward,
                                        color: primaryColor),
                                    Text("Enroller",
                                        style: TextStyle(color: primaryColor)),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: MyCustomTab(course: widget.course))
          ],
        ),
      ),
    );
  }
}
