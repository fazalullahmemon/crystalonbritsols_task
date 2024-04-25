import 'package:crystalonbritsols_task/screens/home/home_controller.dart';
import 'package:crystalonbritsols_task/screens/login/login_screen_controller.dart';
import 'package:get/get.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController(),
        fenix: true);
    Get.lazyPut<HomeScreenController>(() => HomeScreenController(),
        fenix: true);
  }
}
