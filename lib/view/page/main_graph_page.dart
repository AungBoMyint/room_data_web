import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:quiver/time.dart';
import 'package:stayria_frontend/constant/mocek_data.dart';
import 'package:stayria_frontend/constant/theme/color.dart';
import 'package:stayria_frontend/model/data_model.dart';
import 'package:stayria_frontend/utils/utils.dart';
import 'package:stayria_frontend/view/widget/bar_data.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/bar_group_data.dart';
import 'package:stayria_frontend/view/widget/top_title/top_bar_title.dart';

class MainGraphPage extends StatefulWidget {
  const MainGraphPage({Key? key}) : super(key: key);

  @override
  State<MainGraphPage> createState() => _MainGraphPageState();
}

class _MainGraphPageState extends State<MainGraphPage> {
  late LinkedScrollControllerGroup _linkedController;
  late ScrollController _titleController;
  late ScrollController _bodyController;

  @override
  void initState() {
    _linkedController = LinkedScrollControllerGroup();
    _titleController = _linkedController.addAndGet();
    _bodyController = _linkedController.addAndGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final daysOfMonth = daysInMonth(2021, 1);
    final daysList = getDaysInMonth(totalDay: daysOfMonth);
    final dataModel = DataModal.fromJson(rawJson);
    return Scaffold(
      body: SafeArea(
        child: BarData(
          topBarTitle: TopBarTitle(
            rightBarScrollController: _titleController,
            daysList: daysList,
            backgroundColor: topBarBackgroundColor,
            roomDetailsListForPercentage: dataModel.data[0].data,
          ),
          groupData: BarGroupData(
            typeModelList: dataModel.data,
            daysOfMonth: daysOfMonth,
            scrollController: _bodyController,
          ),
        ),
      ),
    );
  }
}
