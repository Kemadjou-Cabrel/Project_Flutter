import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kPaddingValue),
        margin: const EdgeInsets.symmetric(horizontal: kPaddingValue),
        decoration: BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.circular(kRadiusSize),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: kNormalSize,
            ),
          ),
        ),
      ),
    );
  }
}
