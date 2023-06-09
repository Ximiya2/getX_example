import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_x_example/mianView.dart';
import 'package:get_x_example/service/bind_service.dart';
import 'package:get_x_example/view/home/homeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
      initialBinding: BindService(),
      getPages: [
        GetPage(
            name: '/HomePage',
            page: () => HomePage(),
            binding: BindService(),
        )
      ],
    );
  }
}
