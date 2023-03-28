import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_x_example/controller/home_controller.dart';
import 'package:get_x_example/controller/splash_controller.dart';
import 'package:get_x_example/controller/starter_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  }
}