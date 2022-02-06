import 'package:flutter/material.dart';
import 'package:stayria_frontend/view/widget/top_title/left_top_title_bar.dart';
import 'package:stayria_frontend/view/widget/top_title/right_top_title_bar.dart';

class TopBarTitle extends StatelessWidget {
  final ScrollController rightBarScrollController;
  final List<String> daysList;
  final Color backgroundColor;
  const TopBarTitle({
    Key? key,
    required this.daysList,
    required this.rightBarScrollController,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: backgroundColor,
        height: 100,
        child: Row(
          children: [
            LeftTopTitleBar(width: size.width * 0.2),
            Expanded(
              child: RightTopTitleBarList(
                  daysList: daysList,
                  rightBarScrollController: rightBarScrollController),
            ),
          ],
        ));
  }
}
