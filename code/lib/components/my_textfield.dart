import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingValue),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kMainColor),
            borderRadius: BorderRadius.circular(kRadiusSize),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kTertiaryColor),
            borderRadius: BorderRadius.circular(kRadiusSize),
          ),
          fillColor: kMainColor,
          filled: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
