import 'package:flutter/material.dart';
import 'package:stayria_frontend/constant/theme/color.dart';

class LeftRoomData extends StatelessWidget {
  final double width;
  final double height;
  final Widget typeIcon;
  final String typeTitle;
  final String typeDescription;
  final int totalItems;
  final String typeRoomOrBed;
  const LeftRoomData({
    Key? key,
    required this.width,
    required this.height,
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
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        width: width,
        height: height,
        child:

            ///Right Bar
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top Room Type
              SingleChildScrollView(
                child: Row(
                  children: [
                    //Type Icon Room (or) Bed
                    typeIcon,
                    //Space
                    const SizedBox(width: 10),
                    //Type Title   //Description
                    Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$typeTitle-$typeDescription",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  )),
                    ),
                  ],
                ),
              ),
              //Space for Inventory Description
              const SizedBox(height: 20),
              Text("Physical Inventory",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: dayTextColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      )),

              //Space
              const SizedBox(height: 10),
              //TypeCircle
              Container(
                alignment: Alignment.center,
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  color: topBarBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Total Item
                      Text(
                        "$totalItems",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      //Space
                      const SizedBox(height: 10),
                      //Type Text
                      Text(
                        typeRoomOrBed,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
