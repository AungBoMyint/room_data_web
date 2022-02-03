import 'package:stayria_frontend/model/room_detail.dart';

double getPercentageDouble(
    {required int number, required int totalNumber, required double size}) {
  final prePercentage = number / totalNumber;
  return double.parse(prePercentage.toStringAsFixed(2)) * size;
}

int getDay({required String dateTime}) {
  final date = DateTime.tryParse(dateTime);
  return date?.day ?? 0;
}

//Make Current RoomType's RoomMap
Map<String, RoomDetail> makCurrentRoomTypeRoomDetailMap(
    List<RoomDetail> roomDetailDataList) {
  final Map<String, RoomDetail> resultMap = {};
  for (var item in roomDetailDataList) {
    final dateIndex = getDay(dateTime: item.date);
    resultMap.putIfAbsent("$dateIndex", () => item);
  }
  print("Result Map: $resultMap");
  return resultMap;
}
