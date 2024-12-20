import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/homescreen.dart';
import 'package:clonexaralalmobileapp/screens/loginscreen.dart';
import 'package:clonexaralalmobileapp/screens/profilescren.dart';
import 'package:clonexaralalmobileapp/screens/savedcourscren.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentIndex = 0;
  final auth = FirebaseAuth.instance;
  late String? loggedInUser;
  bool isLogged = false;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final User? user = auth.currentUser;
      if (user != null) {
        loggedInUser = user.email;
        setState(() {
          isLogged = true;
        });
      }
    } catch (e) {
      throw e.toString();
    }
  }

  final List<Widget> _pages = [
    Homescreen(),
    SavedCoursesScreen(),
    Profilescren()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add),
            label: 'Mes Cours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
