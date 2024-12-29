import 'package:clonexaralalmobileapp/screens/forgotPasswordscreen.dart';
import 'package:clonexaralalmobileapp/screens/resetPasswordscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void initDynamicLinks(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    final Uri deepLink = dynamicLinkData.link;

    if (deepLink.queryParameters['mode'] == 'resetPassword') {
      // Redirigez l'utilisateur vers une page appropriée
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Resetpasswordscreen()),
      );
    }
  }).onError((error) {
    print('Erreur de lien dynamique : $error');
  });
}
