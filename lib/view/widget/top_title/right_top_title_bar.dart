import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayria_frontend/controller/server_controller.dart';

class RightTopTitleBarList extends StatelessWidget {
  final List<String> daysList;
  const RightTopTitleBarList({Key? key, required this.daysList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServerController _controller = Get.find();
    ScrollController _scrollController =
        _controller.addAndGetScrollControllerGroupd();
    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      children: List.generate(daysList.length, (index) {
        return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${index + 1}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text(daysList[index],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ))
              ],
            ));
      }),
    );
  }
}
