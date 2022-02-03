import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayria_frontend/controller/server_controller.dart';
import 'package:stayria_frontend/model/data_model.dart';
import 'package:stayria_frontend/model/type_model.dart';
import 'package:stayria_frontend/utils/utils.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/left_room_data.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/right_room_data.dart';

class BarGroupData extends StatelessWidget {
  final TypeModel typeModel;
  final int daysOfMonth;
  const BarGroupData(
      {Key? key, required this.typeModel, required this.daysOfMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = typeModel.inventory;
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.tealAccent,
        height: size.height * 0.3,
        child: LayoutBuilder(builder: (context, sizeY) {
          final roomDetailMap = makCurrentRoomTypeRoomDetailMap(
              typeModel.data); //Make New Map DetailModel
          final y = sizeY.maxHeight - 50;
          return Row(
            children: [
              LeftRoomData(
                width: size.width * 0.3,
                typeIcon: const Icon(
                  Icons.door_front_door_outlined,
                  color: Colors.blue,
                ),
                typeTitle: typeModel.code,
                typeDescription: typeModel.description,
                totalItems: typeModel.inventory,
                typeRoomOrBed: "Room",
              ),
              //Right Room Data List
              Expanded(
                child: RightRoomDataList(
                  daysOfMonth: daysOfMonth,
                  roomDetailMap: roomDetailMap,
                  total: total,
                  y: y,
                ),
              ),
            ],
          );
        }));
  }
}
