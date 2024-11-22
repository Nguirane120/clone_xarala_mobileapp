import 'package:clonexaralalmobileapp/data/models/course.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;
  final List<Course> savedCourses;

  CourseLoaded(this.courses, {this.savedCourses = const []});
}

class CourseError extends CourseState {
  final String message;
  CourseError(this.message);
}