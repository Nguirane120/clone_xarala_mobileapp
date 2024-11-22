import 'package:clonexaralalmobileapp/bloc/course_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/course_event.dart';
import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Xarala Academy',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: primaryColor, foregroundColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.02),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => CourseBloc()..add(LoadCourses()),
            child: Mainscreen()));
  }
}
