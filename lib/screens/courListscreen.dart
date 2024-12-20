import 'package:clonexaralalmobileapp/bloc/course_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/course_event.dart';
import 'package:clonexaralalmobileapp/bloc/course_state.dart';
import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/coursDetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc()..add(LoadCourses()),
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseLoaded) {
            final courses = state.courses;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.45, // Augmenté la hauteur
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final data = courses[index];
                    return Container(
                      // color: secondaryColor,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursDetailscreen(
                                      course: courses[index])));
                        },
                        child: Card(
                          elevation: 5,
                          // color: Colors.white,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      child: SvgPicture.asset(
                                        data.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.white,
                                          radius: 16,
                                          child: Text(
                                            '${data.instructor[0].toUpperCase()}${data.instructor.split(' ').length > 1 ? data.instructor.split(' ')[1][0].toUpperCase() : ''}',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        Expanded(
                                          child: Text(
                                            data.instructor,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    title: Text(
                                      data.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 14,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      data.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  const Divider(height: 1),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.mic,
                                              color: Colors.black38,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              data.language,
                                              style: const TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data.coursTatuts,
                                          style: const TextStyle(
                                            color: greenColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CourseBloc>()
                                            .add(AddToSavedCourses(data));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Cours ajouté aux favoris'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is CourseError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Aucune donnée disponible.'));
        },
      ),
    );
  }
}
