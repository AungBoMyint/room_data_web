import 'package:flutter/material.dart';
import 'package:stayria_frontend/model/room_detail.dart';

class RightTopTitleBarList extends StatelessWidget {
  final ScrollController rightBarScrollController;
  final List<String> daysList;
  final List<RoomDetail> roomDetailsList;
  const RightTopTitleBarList({
    Key? key,
    required this.daysList,
    required this.rightBarScrollController,
    required this.roomDetailsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: rightBarScrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      children: List.generate(daysList.length, (index) {
        final percent = roomDetailsList[index].percent;
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
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 20, color: Colors.black),
                ),
                Text(
                  daysList[index],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                //Space
                const SizedBox(height: 5),
                Text(
                  "$percent%",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: percent < 49
                        ? Colors.red
                        : percent < 50
                            ? Colors.yellow
                            : Colors.greenAccent.shade400,
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
