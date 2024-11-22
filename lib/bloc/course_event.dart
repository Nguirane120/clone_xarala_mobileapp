import 'package:clonexaralalmobileapp/data/models/course.dart';

abstract class CourseEvent {}

class LoadCourses extends CourseEvent {}

class AddToSavedCourses extends CourseEvent {
  final Course course;
  AddToSavedCourses(this.course);
}

class RemoveFromSavedCourses extends CourseEvent {
  final Course course;
  RemoveFromSavedCourses(this.course);
}