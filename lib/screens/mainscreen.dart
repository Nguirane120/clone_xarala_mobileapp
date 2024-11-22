import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/homescreen.dart';
import 'package:clonexaralalmobileapp/screens/loginscreen.dart';
import 'package:clonexaralalmobileapp/screens/savedcourscren.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    SavedCoursesScreen(),
    Center(child: Text('Profil', style: TextStyle(fontSize: 24))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
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
