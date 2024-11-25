import 'package:clonexaralalmobileapp/data/models/course.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends HydratedBloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = [
          Course(
            title: 'Debuter avec flutter',
            description: 'Apprenez les bases de Flutter.',
            instructor: 'Ousseynou Diop',
            youtubeLink: 'https://youtube.com/flutter-beginners',
            imagePath: 'images/mobile_development.svg',
            language: "Francais",
            coursTatuts: "Gratuit",
            chapters: [
              Chapter(
                chapterNumber: 1,
                title: 'Introduction à Flutter',
                description:
                    'Ce chapitre vous introduira aux concepts de base de Flutter.',
              ),
              Chapter(
                chapterNumber: 2,
                title: 'Widgets Flutter',
                description: 'Apprenez à utiliser les widgets dans Flutter.',
              ),
              
            ],
          ),
          Course(
              title: 'Devnir developpeur',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Jane Smith',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/dev.svg',
              language: "Francais",
              coursTatuts: "Gratuit",
              chapters: [
                Chapter(
                  chapterNumber: 2,
                  title: 'Introduction à Flutter',
                  description:
                      'Ce chapitre vous introduira aux concepts de base de Flutter.',
                ),
                Chapter(
                  chapterNumber: 2,
                  title: 'Widgets Flutter',
                  description: 'Apprenez à utiliser les widgets dans Flutter.',
                ),
              ]),
          Course(
              title: 'Debuttez avec typscript',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/typing.svg',
              language: "Wolof",
              coursTatuts: "Gratuit",
              chapters: [
                Chapter(
                  chapterNumber: 2,
                  title: 'Introduction à Flutter',
                  description:
                      'Ce chapitre vous introduira aux concepts de base de Flutter.',
                ),
                Chapter(
                  chapterNumber: 2,
                  title: 'Widgets Flutter',
                  description: 'Apprenez à utiliser les widgets dans Flutter.',
                ),
              ]),
          Course(
              title: 'Reactjs',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/react.svg',
              language: "Francais",
              coursTatuts: "Gratuit",
              chapters: [
                Chapter(
                  chapterNumber: 1,
                  title: 'Introduction à Flutter',
                  description:
                      'Ce chapitre vous introduira aux concepts de base de Flutter.',
                ),
                Chapter(
                  chapterNumber: 2,
                  title: 'Widgets Flutter',
                  description: 'Apprenez à utiliser les widgets dans Flutter.',
                ),
                
              ]),
          Course(
              title: 'Version control avec git',
              description: 'Maîtrisez les concepts avancés de Dart.',
              instructor: 'Ousseynou Diop',
              youtubeLink: 'https://youtube.com/dart-advanced',
              imagePath: 'images/git.svg',
              language: "Francais",
              coursTatuts: "Gratuit",
              chapters: [
                Chapter(
                  chapterNumber: 1,
                  title: 'Introduction à Flutter',
                  description:
                      'Ce chapitre vous introduira aux concepts de base de Flutter.',
                ),
                Chapter(
                  chapterNumber: 2,
                  title: 'Widgets Flutter',
                  description: 'Apprenez à utiliser les widgets dans Flutter.',
                ),
              ]),
        ];
        emit(CourseLoaded(courses,
            savedCourses: state is CourseLoaded
                ? (state as CourseLoaded).savedCourses
                : []));
      } catch (e) {
        emit(CourseError('Erreur lors du chargement des cours'));
      }
    });

    on<AddToSavedCourses>((event, emit) {
      if (state is CourseLoaded) {
        final currentState = state as CourseLoaded;
        final isAlreadySaved = currentState.savedCourses.contains(event.course);

        if (!isAlreadySaved) {
          final updatedSavedCourses =
              List<Course>.from(currentState.savedCourses)..add(event.course);

          emit(CourseLoaded(
            currentState.courses,
            savedCourses: updatedSavedCourses,
          ));
        }
      }
    });

    on<RemoveFromSavedCourses>((event, emit) {
      if (state is CourseLoaded) {
        final currentState = state as CourseLoaded;
        final updatedSavedCourses = List<Course>.from(currentState.savedCourses)
          ..remove(event.course);

        emit(CourseLoaded(
          currentState.courses,
          savedCourses: updatedSavedCourses,
        ));
      }
    });
  }

  @override
  CourseState fromJson(Map<String, dynamic> json) {
    try {
      final savedCourses = (json['savedCourses'] as List)
          .map((course) => Course.fromJson(course))
          .toList();
      return CourseLoaded([], savedCourses: savedCourses);
    } catch (_) {
      return CourseInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(CourseState state) {
    if (state is CourseLoaded) {
      return {
        'savedCourses':
            state.savedCourses.map((course) => course.toJson()).toList(),
      };
    }
    return null;
  }
}
