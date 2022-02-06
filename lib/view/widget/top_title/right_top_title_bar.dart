import 'package:flutter/material.dart';

class RightTopTitleBarList extends StatelessWidget {
  final ScrollController rightBarScrollController;
  final List<String> daysList;
  const RightTopTitleBarList(
      {Key? key,
      required this.daysList,
      required this.rightBarScrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: rightBarScrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      children: List.generate(daysList.length, (index) {
        return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${index + 1}",
                  style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),
                ),
                Text(
                  daysList[index],
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ));
      }),
    );
  }
}
