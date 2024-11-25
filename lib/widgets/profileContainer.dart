import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  ProfileContainer({super.key, required this.profileText, this.color});
  final String profileText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          border: Border()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            profileText,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_forward, color: color,),
        ],
      ),
    );
  }
}