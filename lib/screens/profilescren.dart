import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/change_pwd_screen.dart';
import 'package:clonexaralalmobileapp/screens/edit_profile_screen.dart';
import 'package:clonexaralalmobileapp/screens/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Future<void> launch(String url, bool isNewTab) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  void logout() async {
    bool isLoggingOut = false;

    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Déconnexion'),
              content: Text('Voulez-vous vraiment vous déconnecter ?'),
              actions: [
                if (isLoggingOut)
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  )
                else ...[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(false); // Annuler la déconnexion
                    },
                    child: Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        isLoggingOut = true; // Activer le loader
                      });
                      Navigator.of(context)
                          .pop(true); // Confirmer la déconnexion
                    },
                    child: Text('Déconnecter'),
                  ),
                ],
              ],
            );
          },
        );
      },
    );

    if (shouldLogout == true) {
      try {
        await _auth.signOut();
        print('Utilisateur déconnecté');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        ); // Naviguer vers l'écran de connexion
      } catch (e) {
        print('Erreur lors de la déconnexion: $e');
      }
    }
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
            DrawerList(context,
                text: "À propos",
                icon: Icons.info,
                iconColor: Colors.teal, onTap: () {
              launchUrl(Uri.parse('https://www.xarala.co/about/'),
                  webOnlyWindowName: '_blank');
            }),
            DrawerList(context,
                text: "Politique de confidentialité",
                icon: Icons.privacy_tip,
                iconColor: Colors.purple, onTap: () {
              launchUrl(Uri.parse('https://www.xarala.co/privacy-policy/'),
                  webOnlyWindowName: '_blank');
            }),
            DrawerList(context,
                text: "FAQ",
                icon: Icons.help_center_outlined,
                iconColor: Colors.green, onTap: () {
              launchUrl(Uri.parse('https://www.xarala.co/faq/'),
                  webOnlyWindowName: '_blank');
            }),
            DrawerList(context,
                text: "Déconnexion",
                icon: Icons.logout,
                iconColor: Colors.red,
                onTap: logout),
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
        //close the drawer
        Navigator.pop(context);
      },
    );
  }
}
