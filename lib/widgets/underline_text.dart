import 'package:flutter/material.dart';

import '../colors.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText({Key? key, required this.text, this.fontSize})
      : super(key: key);
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text[0],
          style: TextStyle(
              shadows: [Shadow(color: titleTextColor, offset: Offset(0, -5))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: underLineColor,
              decorationThickness: 6,
              decorationStyle: TextDecorationStyle.solid,
              fontSize: fontSize ?? 18.0,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            text.substring(1, text.length),
            style: TextStyle(
                fontSize: fontSize ?? 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
