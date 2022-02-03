import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/time.dart';
import 'package:stayria_frontend/controller/server_controller.dart';
import 'package:stayria_frontend/view/widget/bar_data.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/bar_group_data.dart';
import 'package:stayria_frontend/view/widget/top_title/top_bar_title.dart';

class MainGraphPage extends StatelessWidget {
  const MainGraphPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServerController _controller = Get.find();
    final daysOfMonth = daysInMonth(2020, 1);
    final daysList = _controller.getDaysInMonth(totalDay: daysOfMonth);
    final dataModal = _controller.dataModal;
    return Scaffold(
        body: SafeArea(
            child: BarData(
      topBarTitle: TopBarTitle(
        daysList: daysList,
      ),
      groupData: dataModal.data.map((typeModel) {
        return BarGroupData(typeModel: typeModel, daysOfMonth: daysOfMonth);
      }).toList(),
    )));
  }
}
