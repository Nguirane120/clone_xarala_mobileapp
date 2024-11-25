import 'package:clonexaralalmobileapp/data/models/course.dart';
import 'package:flutter/material.dart';


class Chaptertab extends StatelessWidget {
  final Course course;

  const Chaptertab({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: course.chapters.length,
      itemBuilder: (context, index) {
        Chapter chapter = course.chapters[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(chapter.chapterNumber.toString()),
              ),
              title: Text(
                chapter.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(chapter.description),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {
                  // Add navigation or play logic here
                },
              ),
            ),
          ),
        );
      },
    );
  }
}