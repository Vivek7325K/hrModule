import 'package:flutter/material.dart';

class PaginatedTableCell extends StatelessWidget {
  String? text;
  Widget? child;
  double width;
  double fontSize;
  Color textColor;
  Color bgColor;
  PaginatedTableCell({
    Key? key,
    this.text,
    this.child,
    required this.width,
    required this.fontSize,
    required this.textColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
          )),
      child: child ??
          Text(
            "$text",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: fontSize, color: textColor),
          ),
    );
  }
}
