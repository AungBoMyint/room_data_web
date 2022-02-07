import 'package:flutter/material.dart';
import 'package:stayria_frontend/constant/theme/color.dart';
import 'package:stayria_frontend/model/bottom/item.dart';

final List<Item> itemList = [
  Item(
      text: "Available",
      child: Container(color: availableColor, width: 30, height: 30)),
  Item(text: "Sold", child: Container(color: soldColor, width: 30, height: 30)),
  Item(
      text: "Out of Order",
      child: Container(color: outOfOrderColor, width: 30, height: 30)),
  Item(
      text: "Allowed over booked",
      child: Container(color: overBookedColor, width: 30, height: 30)),
  Item(
      text: "Available and Allocation",
      child: Container(color: specialAvailableColor, width: 30, height: 30)),
  Item(
      text: "Sold-Online",
      child: Container(color: soldOnlineColor, width: 30, height: 30)),
  Item(
      text: "Out of inventory",
      child: Container(color: Colors.red, width: 30, height: 30)),
  const Item(
      text: "Closed",
      child: Text(
        "🚫",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      )),
];
