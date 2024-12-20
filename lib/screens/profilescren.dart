import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/change_pwd_screen.dart';
import 'package:clonexaralalmobileapp/screens/edit_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/profileInfo.dart';

class Profilescren extends StatefulWidget {
  const Profilescren({super.key});

  @override
  State<Profilescren> createState() => _ProfilescrenState();
}

class _ProfilescrenState extends State<Profilescren> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = true;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(currentUser.uid).get();

        if (userDoc.exists && userDoc.data() != null) {
          setState(() {
            userData = userDoc.data() as Map<String, dynamic>;
            isLoading = false;
          });
        } else {
          print("Document utilisateur introuvable ou données non valides.");
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Erreur lors de la récupération des données utilisateur : $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Profile"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      backgroundColor: primaryColor,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/pp.jpeg'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            userData != null
                                ? userData!['name'] ?? "Nom non défini"
                                : "Chargement...",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userData != null
                                ? userData!['email'] ?? "Email non défini"
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfileScreen()));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            DrawerList(
              context,
              text: "Mon Profile",
              icon: Icons.person,
              iconColor: Colors.blue,
            ),
            DrawerList(
              context,
              text: "Modifier mon mot de passe",
              icon: Icons.password_outlined,
              iconColor: Colors.orange,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()));
              },
            ),
            DrawerList(
              context,
              text: "À propos",
              icon: Icons.info,
              iconColor: Colors.teal,
            ),
            DrawerList(
              context,
              text: "Politique de confidentialité",
              icon: Icons.privacy_tip,
              iconColor: Colors.purple,
            ),
            DrawerList(
              context,
              text: "FAQ",
              icon: Icons.help_center_outlined,
              iconColor: Colors.green,
            ),
            DrawerList(
              context,
              text: "Déconnexion",
              icon: Icons.logout,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
          ),
          SizedBox(
            height: 20,
          ),
          PriofileInfo()
        ],
      ),
    );
  }

  ListTile DrawerList(BuildContext context,
      {required String text,
      required IconData icon,
      Color? iconColor,
      VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      leading: Icon(
        icon,
        color: iconColor,
      ),
      selected: _selectedIndex == 0,
      onTap: () {
        onTap!();
      },
    );
  }
}
