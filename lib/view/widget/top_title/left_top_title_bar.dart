import 'package:flutter/material.dart';

class LeftTopTitleBar extends StatelessWidget {
  final double width;
  const LeftTopTitleBar({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      width: width,
      child: const Center(
        child: Text("Room/Bed",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
