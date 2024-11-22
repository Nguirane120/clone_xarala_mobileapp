import 'package:clonexaralalmobileapp/bloc/course_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/course_event.dart';
import 'package:clonexaralalmobileapp/bloc/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SavedCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CourseLoaded) {
          if (state.savedCourses.isEmpty) {
            return const Center(
              child: Text('Aucun cours sauvegardé'),
            );
          }

          return ListView.builder(
            itemCount: state.savedCourses.length,
            itemBuilder: (context, index) {
              final course = state.savedCourses[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: SvgPicture.asset(
                    course.imagePath,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(course.title),
                  subtitle: Text(course.instructor),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<CourseBloc>().add(RemoveFromSavedCourses(course));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Cours supprimé des favoris'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}