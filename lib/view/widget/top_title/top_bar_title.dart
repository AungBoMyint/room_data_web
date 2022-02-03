import 'package:flutter/material.dart';
import 'package:stayria_frontend/view/widget/top_title/left_top_title_bar.dart';
import 'package:stayria_frontend/view/widget/top_title/right_top_title_bar.dart';

class TopBarTitle extends StatelessWidget with PreferredSizeWidget {
  final List<String> daysList;
  const TopBarTitle({Key? key, required this.daysList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.tealAccent,
        height: 100,
        child: Row(
          children: [
            LeftTopTitleBar(width: size.width * 0.3),
            Expanded(
              child: RightTopTitleBarList(daysList: daysList),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
