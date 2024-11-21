import 'package:clonexaralalmobileapp/bloc/course_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/course_event.dart';
import 'package:clonexaralalmobileapp/bloc/course_state.dart';
import 'package:clonexaralalmobileapp/const.dart';
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
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final data = courses[index];
                    return Container(
                      color: secondaryColor,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: SvgPicture.asset(
                                    data.imagePath,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    child: Text(
                                      '${data.instructor[0].toUpperCase()}${data.instructor.split(' ').length > 1 ? data.instructor.split(' ')[1][0].toUpperCase() : ''}',
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text(data.instructor),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  data.title,
                                ),
                                subtitle: Text(data.description),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.mic,
                                          color: Colors.black38,
                                        ),
                                        Text(data.language,
                                            style: TextStyle(
                                              color: Colors.black38,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Text(
                                    data.coursTatuts,
                                    style: TextStyle(
                                        color: Color(
                                          0xff19B783,
                                        ),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
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
