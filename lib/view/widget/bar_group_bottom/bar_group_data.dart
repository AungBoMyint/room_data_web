import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:stayria_frontend/model/type_model.dart';
import 'package:stayria_frontend/utils/utils.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/left_room_data.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/right_room_data.dart';

class BarGroupData extends HookWidget {
  final ScrollController scrollController;
  final List<TypeModel> typeModelList;
  final int daysOfMonth;
  const BarGroupData({
    Key? key,
    required this.typeModelList,
    required this.daysOfMonth,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Initialize
    LinkedScrollControllerGroup _groupController =
        LinkedScrollControllerGroup();
    ScrollController _leftController = _groupController.addAndGet();
    ScrollController _rightController = _groupController.addAndGet();
    //
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
          child: ListView(
            controller: _leftController,
            physics: const ClampingScrollPhysics(),
            children: List.generate(typeModelList.length, (index) {
              return LeftRoomData(
                height: size.height * 0.4,
                width: size.width * 0.3,
                typeIcon: const Icon(
                  Icons.door_sliding_outlined,
                  color: Colors.blue,
                  size: 50,
                ),
                typeTitle: typeModelList[index].code,
                typeDescription: typeModelList[index].description,
                totalItems: typeModelList[index].inventory,
                typeRoomOrBed: "Room",
              );
            }),
          ),
        ),
        //Right Room Data List
        Expanded(
            child: SingleChildScrollView(
                controller: scrollController,
                //physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: daysOfMonth * 50,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      controller: _rightController,
                      children: List.generate(typeModelList.length, (index) {
                        return SizedBox(
                          child: RightRoomDataList(
                            daysOfMonth: daysOfMonth,
                            roomDetailMap: makCurrentRoomTypeRoomDetailMap(
                                typeModelList[index].data),
                            total: typeModelList[index].inventory,
                            y: size.height * 0.4,
                          ),
                        );
                      }),
                    )))),
      ],
    );
  }
}
