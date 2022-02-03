import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayria_frontend/view/page/main_graph_page.dart';

import 'controller/server_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ServerController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainGraphPage(),
    );
  }
}
