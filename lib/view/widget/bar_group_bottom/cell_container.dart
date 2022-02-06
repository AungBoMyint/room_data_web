import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cellContainer(Color color, double height, String text) {
  return Container(
    width: 50,
    color: color,
    height: height,
    alignment: Alignment.center,
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
