import 'package:flutter/material.dart';

class LeftTopTitleBar extends StatelessWidget {
  final double width;
  const LeftTopTitleBar({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.3),
      ),
      width: width,
      alignment: Alignment.center,
      child: Text(
        "Room /Bed",
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}
