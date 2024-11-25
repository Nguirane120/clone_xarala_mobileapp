import 'package:clonexaralalmobileapp/const.dart';
import 'package:flutter/material.dart';

import 'profileContainer.dart';

class PriofileInfo extends StatelessWidget {
  const PriofileInfo({
    super.key,
  });

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
                        ProfileContainer(
                          profileText: "Mon Profile",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "Mdifier mon mot de passe",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "Favoris",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "A propos",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "Politique de confidentialite",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "FAQ",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "Deconnexion",
                          color: primaryColor,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProfileContainer(
                          profileText: "Supprimer mon compote",
                          color: primaryColor,
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
