import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String title;
  final String description;
  final String instructor;
  final String youtubeLink;
  final String imagePath;
  final String language;
  final String coursTatuts;

  const Course(
      {required this.title,
      required this.description,
      required this.instructor,
      required this.youtubeLink,
      required this.imagePath,
      required this.language, required this.coursTatuts});

  @override
  List<Object?> get props =>
      [title, description, instructor, youtubeLink, imagePath, language, coursTatuts];
}
