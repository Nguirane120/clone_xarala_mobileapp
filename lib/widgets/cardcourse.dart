import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/data/models/course.dart';
import 'package:flutter/material.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({
    super.key,
    required this.courses,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height *
            0.4, 
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Container(
              decoration: BoxDecoration(color: secondaryColor),
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                // elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        course.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(course.instructor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        course.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
