import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class primaryInput extends StatelessWidget {
  final bool isPassword;
  final String? labelText;
  final TextEditingController controller;
  final Function(String) onChanged;

  primaryInput({
    super.key,
    this.isPassword = true,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? InkWell(
                onTap: () {},
                child: Icon(
                  Icons.visibility_outlined,
                  color: Colors.white,
                ),
              )
            : null,
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white,
        hintText: labelText,
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: labelText,
      ),
    );
  }
}
