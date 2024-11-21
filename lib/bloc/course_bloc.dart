import 'package:clonexaralalmobileapp/data/models/course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) async {
      emit(CourseLoading());

      try {
        // Simulation de récupération des cours
        final courses = [
          const Course(
              title: 'Debuter avec flutter',
              description: 'Apprenez les bases de Flutter.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/flutter-beginners',
              imagePath: 'images/mobile_development.svg',
              language: "Francais", coursTatuts: "Gratuit"),
          const Course(
              title: 'Devnir developpeur',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Jane Smith',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/dev.svg',
              language: "Francais", coursTatuts: "Gratuit"),
          const Course(
              title: 'Debuttez avec typscript',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/typing.svg',
              language: "Wolof", coursTatuts: "Gratuit"),
          const Course(
              title: 'Reactjs',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/react.svg',
              language: "Francais", coursTatuts: "Gratuit"),
          const Course(
              title: 'Version control avec git',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/git.svg',
              language: "Francais", coursTatuts: "Gratuit"),
        ];

        emit(CourseLoaded(courses));
      } catch (e) {
        emit(CourseError('Erreur lors du chargement des cours'));
      }
    });
  }
}
