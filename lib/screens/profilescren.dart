import 'package:clonexaralalmobileapp/const.dart';
import 'package:flutter/material.dart';

import '../widgets/profileInfo.dart';

class Profilescren extends StatelessWidget {
  const Profilescren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: EdgeInsets.only(left: 5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/pp.jpeg'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Bienvenu",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "user full name",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 130,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PriofileInfo()
        ],
      ),
    );
  }
}


