import 'package:get/get.dart';
import 'package:getx_mvvm/app/modules/splash/controllers/splash_controller.dart';

import '/app/modules/other/controllers/other_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
