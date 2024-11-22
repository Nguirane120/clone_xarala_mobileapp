import 'package:flutter/material.dart';

class TextformWidget extends StatefulWidget {
  TextformWidget(
      {super.key,
      required this.contontroller,
      required this.labelText,
      this.inputTitle,
      this.suffixIcon,
      required this.prefixIcon,
      required this.textInputType,
      this.obscureText});
  final TextEditingController contontroller;
  final String labelText;
  final String? inputTitle;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final TextInputType textInputType;
  final bool? obscureText;

  @override
  State<TextformWidget> createState() => _TextformWidgetState();
}

class _TextformWidgetState extends State<TextformWidget> {
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = Colors.grey;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus ? Colors.blue : Colors.grey[200]!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.inputTitle ?? '',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TextFormField(
          keyboardType: widget.textInputType,
          controller: widget.contontroller,
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: _borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _borderColor, width: 2.0),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            labelText: widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez remplir ce champ svp.';
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
