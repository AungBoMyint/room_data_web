import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayria_frontend/constant/bottom/item_list.dart';

class BottomModelWidget extends StatelessWidget {
  const BottomModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.15,
        width: size.width,
        padding: const EdgeInsets.only(left: 30),
        color: Colors.white,
        child: Wrap(
          children: List.generate(itemList.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: bottomWidget(
                  itemList[index].text, itemList[index].child, size),
            );
          }),
        ));
  }
}

Widget bottomWidget(String text, Widget child, Size size) {
  return SizedBox(
    height: 50,
    width: size.width * 0.2,
    child: Row(
      children: [
        child,
        const SizedBox(width: 5),
        Text(text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ))
      ],
    ),
  );
}
