import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:stayria_frontend/controller/server_controller.dart';
import 'package:stayria_frontend/model/room_detail.dart';
import 'package:stayria_frontend/utils/utils.dart';

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
    ServerController _controller = Get.find();
    ScrollController _scrollController =
        _controller.addAndGetScrollControllerGroupd();
    return ListView(
      controller: _scrollController,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(daysOfMonth, (index) {
        if (roomDetailMap.containsKey("${index + 1}")) {
          print("***********True****************");
          //each item Y positioned by Percentage
          final eachRoomDetial = roomDetailMap["${index + 1}"];
          final outOfOrderHeight = getPercentageDouble(
            number: eachRoomDetial?.outOfOrder ?? 0,
            totalNumber: total,
            size: y,
          );
          final availableHeight = getPercentageDouble(
            number: eachRoomDetial?.available ?? 0,
            totalNumber: total,
            size: y,
          );
          final specialHeight = getPercentageDouble(
            number: eachRoomDetial?.specialAvailable ?? 0,
            totalNumber: total,
            size: y,
          );
          final soldOnlineHeight = getPercentageDouble(
            number: eachRoomDetial?.soldOnline ?? 0,
            totalNumber: total,
            size: y,
          );
          final soldHeight = getPercentageDouble(
            number: eachRoomDetial?.sold ?? 0,
            totalNumber: total,
            size: y,
          );
          final overBookHeight = getPercentageDouble(
            number: eachRoomDetial?.overBooked ?? 0,
            totalNumber: total,
            size: y,
          );

          ///
          return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              width: 50,
              child:
                  //StackColumn
                  Stack(
                fit: StackFit.passthrough,
                children: [
                  //OverBooked
                  Positioned(
                    top: soldHeight +
                        specialHeight +
                        availableHeight +
                        outOfOrderHeight +
                        soldOnlineHeight,
                    child: Container(
                      width: 50,
                      color: Colors.deepPurple,
                      height: overBookHeight,
                      child: Center(
                        child: Text(
                          "${eachRoomDetial?.overBooked}",
                        ),
                      ),
                    ),
                  ),
                  //Sold
                  Positioned(
                    top: specialHeight +
                        availableHeight +
                        outOfOrderHeight +
                        soldOnlineHeight,
                    child: Container(
                      width: 50,
                      color: Colors.blue,
                      height: soldHeight,
                      child: Center(
                        child: Text(
                          "${eachRoomDetial?.sold}",
                        ),
                      ),
                    ),
                  ),
                  // Sold Online
                  Positioned(
                    top: specialHeight + availableHeight + outOfOrderHeight,
                    child: Container(
                      width: 50,
                      color: Colors.blue.shade800,
                      height: soldOnlineHeight,
                      child: Center(
                        child: Text(
                          "${eachRoomDetial?.soldOnline}",
                        ),
                      ),
                    ),
                  ),
                  //Special Available
                  Positioned(
                    top: availableHeight + outOfOrderHeight,
                    child: Container(
                      width: 50,
                      color: Colors.green.shade800,
                      height: specialHeight,
                      child: Center(
                        child: Text(
                          "${eachRoomDetial?.specialAvailable}",
                        ),
                      ),
                    ),
                  ),
                  //Available
                  Positioned(
                    top: outOfOrderHeight,
                    child: Container(
                      width: 50,
                      color: Colors.green,
                      height: availableHeight,
                      child: Center(
                        child: Text(
                          "${eachRoomDetial?.available}",
                        ),
                      ),
                    ),
                  ),
                  //Out of order
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 50,
                      color: Colors.pink,
                      height: outOfOrderHeight,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${eachRoomDetial?.outOfOrder}",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.white),
            ),
            width: 50,
            child: Center(
                child: Text(
              "$total",
            )),
          );
        }
      }),
    );
  }
}
