import 'package:clonexaralalmobileapp/const.dart';
import 'package:flutter/material.dart';

class TextSpanWidget extends StatelessWidget {
  TextSpanWidget(
      {super.key, required this.normalText, required this.wordToStyle});
  final String normalText;
  final String wordToStyle;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: normalText,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: wordToStyle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
