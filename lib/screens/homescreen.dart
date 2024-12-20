import 'package:carousel_slider/carousel_slider.dart';
import 'package:clonexaralalmobileapp/screens/courListscreen.dart';
import 'package:clonexaralalmobileapp/screens/loginscreen.dart';
import 'package:clonexaralalmobileapp/widgets/horizontalCardCategory.dart';
import 'package:clonexaralalmobileapp/widgets/textSpanWidget.dart';
import 'package:clonexaralalmobileapp/widgets/textTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final auth = FirebaseAuth.instance;

  final List<String> imageUrls = [
    'images/mobile_development.svg',
    'images/dev.svg',
    'images/typing.svg',
    'images/react.svg',
    'images/git.svg'
  ];

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
        await auth.signOut();
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
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.2,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(),
                      child: SvgPicture.asset(
                        url,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: TextSpanWidget(
                  normalText: 'Nos catégories ', wordToStyle: 'Phares'),
            ),
            HorizontalScrollCardsWithIcons(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: TextSpanWidget(
                  normalText: 'Selection de  ', wordToStyle: 'Cours'),
            ),
            CourseListScreen(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Texttitle(text: "Developpement web et mobile"),
            CourseListScreen(),
          ],
        ),
      ),
    );
  }
}
