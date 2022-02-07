import 'package:stayria_frontend/model/room_detail.dart';

double getPercentageDouble(
    {required int number, required int totalNumber, required double size}) {
  final prePercentage = number / totalNumber;
  return double.parse(prePercentage.toStringAsFixed(2)) * size;
}

int getDay({required String dateTime}) {
  //We will change this method when fetching from remote server
  /*final date = DateTime.tryParse("20141131");
  return date?.day ?? 0;*/
  return int.parse(dateTime);
}

//Make Current RoomType's RoomMap
Map<String, RoomDetail> makCurrentRoomTypeRoomDetailMap(
    List<RoomDetail> roomDetailDataList) {
  final Map<String, RoomDetail> resultMap = {};
  for (var item in roomDetailDataList) {
    final dateIndex = getDay(dateTime: item.date);
    resultMap.putIfAbsent("$dateIndex", () => item);
  }
  return resultMap;
}

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
