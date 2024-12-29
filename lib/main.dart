import 'package:clonexaralalmobileapp/bloc/course_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/course_event.dart';
import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/dynamic_link.dart';
import 'package:clonexaralalmobileapp/repositry/auth.dart';
import 'package:clonexaralalmobileapp/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/bloc/auth_bloc.dart';
import 'firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authRepository = AuthenticationRepository();
  void initState() {
    super.initState();
    initDynamicLinks(context); // Passer le contexte ici
  }

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
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthenticationBloc(authRepository),
            ),
            BlocProvider(
              create: (context) => CourseBloc()..add(LoadCourses()),
            ),
          ],
          child: Mainscreen(),
        ));
  }
}
