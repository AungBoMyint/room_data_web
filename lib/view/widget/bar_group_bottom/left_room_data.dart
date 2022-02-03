import 'package:flutter/material.dart';

class LeftRoomData extends StatelessWidget {
  final double width;
  final Widget typeIcon;
  final String typeTitle;
  final String typeDescription;
  final int totalItems;
  final String typeRoomOrBed;
  const LeftRoomData({
    Key? key,
    required this.width,
    required this.typeIcon,
    required this.typeTitle,
    required this.typeDescription,
    required this.totalItems,
    required this.typeRoomOrBed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.white),
        ),
        width: width,
        height: 300,
        child:

            ///Right Bar
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top Room Type
              Row(
                children: [
                  //Type Icon Room (or) Bed
                  typeIcon,
                  //Type Title
                  Expanded(
                    child: Text(
                      typeTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              //Description
              Text(
                typeDescription,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              //TypeCircle
              Container(
                height: 100,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(children: [
                    //Total Item
                    Text(
                      "$totalItems",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    //Type Text
                    Text(
                      typeRoomOrBed,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
