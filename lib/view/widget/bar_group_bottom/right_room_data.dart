import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stayria_frontend/constant/theme/color.dart';
import 'package:stayria_frontend/model/room_detail.dart';
import 'package:stayria_frontend/utils/utils.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/cell_container.dart';

class RightRoomDataList extends HookWidget {
  final int daysOfMonth;
  final Map<String, RoomDetail> roomDetailMap;
  final int total;
  final double y;
  const RightRoomDataList({
    Key? key,
    required this.daysOfMonth,
    required this.roomDetailMap,
    required this.total,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentY = y - 15; //height for all data room except sold blue data
    return SizedBox(
      height: y,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(daysOfMonth, (index) {
          if (roomDetailMap.containsKey("${index + 1}")) {
            //each item Y positioned by Percentage
            final eachRoomDetial = roomDetailMap["${index + 1}"];
            final outOfOrderHeight = getPercentageDouble(
              number: eachRoomDetial?.outOfOrder ?? 0,
              totalNumber: total,
              size: percentY,
            );
            final availableHeight = getPercentageDouble(
              number: eachRoomDetial?.available ?? 0,
              totalNumber: total,
              size: percentY,
            );
            final specialHeight = getPercentageDouble(
              number: eachRoomDetial?.specialAvailable ?? 0,
              totalNumber: total,
              size: percentY,
            );
            final soldOnlineHeight = getPercentageDouble(
              number: eachRoomDetial?.soldOnline ?? 0,
              totalNumber: total,
              size: percentY,
            );
            final soldHeight = getPercentageDouble(
              number: eachRoomDetial?.sold ?? 0,
              totalNumber: total,
              size: percentY,
            );
            final totalHeight = outOfOrderHeight +
                soldOnlineHeight +
                soldHeight +
                availableHeight +
                specialHeight; //For Last Sold Blue
            final remainHeight = percentY - totalHeight;

            ///
            return SingleChildScrollView(
              child: Column(
                children: [
                  //Up Data
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade200, width: 0.1),
                        ),
                        width: 50,
                        height: percentY,
                        child:
                            //StackColumn
                            Stack(
                          children: [
                            //Sold
                            Positioned(
                              top: specialHeight +
                                  availableHeight +
                                  outOfOrderHeight +
                                  soldOnlineHeight,
                              child: cellContainer(
                                soldColor,
                                totalHeight < percentY
                                    ? soldHeight + remainHeight
                                    : soldHeight,
                                //Sure the last blue will fill required height
                                //Upon situation.
                                "${eachRoomDetial!.sold}",
                              ),
                            ),
                            // Sold Online
                            Positioned(
                              top: specialHeight +
                                  availableHeight +
                                  outOfOrderHeight,
                              child: cellContainer(
                                soldOnlineColor,
                                soldOnlineHeight,
                                "${eachRoomDetial.soldOnline}",
                              ),
                            ),
                            //Special Available
                            Positioned(
                              top: availableHeight + outOfOrderHeight,
                              child: cellContainer(
                                specialAvailableColor,
                                specialHeight,
                                "${eachRoomDetial.specialAvailable}",
                              ),
                            ),
                            //Available
                            Positioned(
                              top: outOfOrderHeight,
                              child: cellContainer(
                                availableColor,
                                availableHeight,
                                "${eachRoomDetial.available}",
                              ),
                            ),
                            //Out of order
                            Positioned(
                              top: 0,
                              child: cellContainer(
                                outOfOrderColor,
                                eachRoomDetial.outOfOrder == 0
                                    ? 0
                                    : eachRoomDetial.outOfOrder > 1
                                        ? outOfOrderHeight
                                        : 15,
                                "${eachRoomDetial.outOfOrder}",
                              ),
                            ),
                          ],
                        )),
                  ),
                  //OnlyOverBook Data
                  eachRoomDetial.overBooked > 0
                      ? cellContainer(
                          overBookedColor,
                          y - percentY,
                          "${eachRoomDetial.overBooked}",
                        )
                      : const SizedBox(height: 0),
                ],
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 0.1),
              ),
              width: 50,
              alignment: Alignment.topCenter,
              child: Container(
                color: availableColor,
                height: percentY,
                alignment: Alignment.center,
                child: Text(
                  "$total",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
