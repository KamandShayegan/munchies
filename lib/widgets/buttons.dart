import 'package:flutter/material.dart';
import 'package:munch/widgets/texts.dart';

class MyButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final bool isIcon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;

  MyButton(
      {Key? key,
      this.icon,
      this.text = 'null',
      required this.isIcon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor),
      child: Center(
        child: isIcon
            ? Icon(
                icon,
                color: color,
                size: 18,
              )
            : H2Text(
                text: text!,
                color: color,
                weight: FontWeight.w800,
                // textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
