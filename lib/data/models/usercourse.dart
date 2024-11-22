import 'course.dart'; // Importe ton modèle Course

class UserCourse {
  // final String userId; 
  // final String userName; 
  final List<Course> selectedCourses; 

  UserCourse({
    // required this.userId,
    // required this.userName,
    required this.selectedCourses,
  });

  UserCourse copyWith({
    String? userId,
    String? userName,
    List<Course>? selectedCourses,
  }) {
    return UserCourse(
      // userId: userId ?? this.userId,
      // userName: userName ?? this.userName,
      selectedCourses: selectedCourses ?? this.selectedCourses,
    );
  }
}
