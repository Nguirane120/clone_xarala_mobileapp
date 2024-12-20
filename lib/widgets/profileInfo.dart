import 'package:clonexaralalmobileapp/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profileContainer.dart';

class PriofileInfo extends StatefulWidget {
  const PriofileInfo({
    super.key,
  });

  @override
  State<PriofileInfo> createState() => _PriofileInfoState();
}

class _PriofileInfoState extends State<PriofileInfo> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/pp.jpeg'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProfileContainer(
                          profileText: userData != null
                              ? userData!['name'] ?? "Nom non défini"
                              : "Chargement...",
                          gotoAnotherPage: () {},
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: userData != null
                              ? userData!['phone'] ?? "Nom non défini"
                              : "Chargement...",
                          gotoAnotherPage: () {},
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: userData != null
                              ? userData!['email'] ?? "Nom non défini"
                              : "Chargement...",
                          gotoAnotherPage: () {},
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
