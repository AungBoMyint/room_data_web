import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:stayria_frontend/constant/mock_json.dart';
import 'package:stayria_frontend/model/data_model.dart';

class ServerController extends GetxController {
  late DataModal dataModal;
  late LinkedScrollControllerGroup _groupControllers;

  @override
  void onInit() {
    _groupControllers = LinkedScrollControllerGroup();
    fetchData();
    super.onInit();
  }

  //Add to Scroll Controller
  ScrollController addAndGetScrollControllerGroupd() {
    return _groupControllers.addAndGet();
  }

  void fetchData() {
    dataModal = DataModal.fromJson(rawJson);
  }

  //
  //Getting Days with Short Name in a Month
  List<String> getDaysInMonth({required int totalDay}) {
    final List<String> days = [];
    var index = 1;
    for (var i = 1; i <= totalDay; i++) {
      switch (index) {
        case 1:
          days.add("Mon");
          break;
        case 2:
          days.add("Tue");
          break;
        case 3:
          days.add("Wed");
          break;
        case 4:
          days.add("Thu");
          break;
        case 5:
          days.add("Fri");
          break;
        case 6:
          days.add("Sat");
          break;
        case 7:
          days.add("Sun");
          break;
        default:
      }
      index++; //Else Do Nothing
      if (index > 7) {
        index = 1;
      }
    }
    return days;
  }
}
