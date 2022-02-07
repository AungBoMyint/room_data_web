import 'package:get/get.dart';

class ServerController extends GetxController {
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
