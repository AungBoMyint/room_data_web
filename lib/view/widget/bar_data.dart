import 'package:flutter/material.dart';
import 'package:stayria_frontend/view/widget/bar_group_bottom/bar_group_data.dart';
import 'package:stayria_frontend/view/widget/top_title/top_bar_title.dart';

class BarData extends StatelessWidget {
  final TopBarTitle topBarTitle;
  final List<BarGroupData> groupData;
  const BarData({Key? key, required this.topBarTitle, required this.groupData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        topBarTitle,
        for (var item in groupData) ...[
          //BarGroupData
          item,
        ]
      ],
    );
  }
}
