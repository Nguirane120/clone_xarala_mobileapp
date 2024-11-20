import 'package:flutter/material.dart';

class TextformWidget extends StatelessWidget {
  TextformWidget(
      {super.key,
      required this.contontroller,
      required this.borderColor,
      required this.labelText,
      this.inputTitle,
      this.suffixIcon,
      required this.prefixIcon,
      required this.textInputType,
      this.obscureText});

  final TextEditingController contontroller;
  final Color borderColor;
  final String labelText;
  final String? inputTitle;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final TextInputType textInputType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            inputTitle ?? '',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TextFormField(
          keyboardType: textInputType,
          controller: contontroller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2.0),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez rempli ce champ svp.';
            }
            return null;
          },
          onChanged: (value) {
            Form.of(context).validate();
          },
        ),
      ],
    );
  }
}
