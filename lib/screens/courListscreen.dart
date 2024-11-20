import 'package:clonexaralalmobileapp/data/models/course.dart';
import 'package:flutter/material.dart';

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Flutter Basics',
      description: 'Learn the basics of Flutter for mobile development.',
      instructor: 'John Doe',
      youtubeLink: 'https://www.youtube.com/watch?v=flutter1',
    ),
    Course(
      title: 'Advanced Dart Programming',
      description:
          'Deep dive into Dart programming for advanced Flutter development.',
      instructor: 'Jane Smith',
      youtubeLink: 'https://www.youtube.com/watch?v=dart1',
    ),
    Course(
      title: 'UI/UX Design Principles',
      description: 'Master the principles of UI/UX design for mobile apps.',
      instructor: 'Michael Lee',
      youtubeLink: 'https://www.youtube.com/watch?v=ux1',
    ),
    Course(
      title: 'Intro to Firebase',
      description: 'Learn how to integrate Firebase into your Flutter apps.',
      instructor: 'Sarah Connor',
      youtubeLink: 'https://www.youtube.com/watch?v=firebase1',
    ),
    Course(
      title: 'Networking in Flutter',
      description:
          'Learn how to make network calls and handle APIs in Flutter.',
      instructor: 'Alex Mercer',
      youtubeLink: 'https://www.youtube.com/watch?v=networking1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300, // Hauteur fixe pour le défilement horizontal
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Container(
              width: 250, // Largeur des cartes de cours
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 5,
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill),
                        onPressed: () {
                          // Action lorsque l'utilisateur appuie pour regarder la vidéo
                
                        },
                      ),
                    )
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
