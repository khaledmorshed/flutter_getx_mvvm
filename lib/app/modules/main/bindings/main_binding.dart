import 'package:get/get.dart';
import 'package:getx_mvvm/app/modules/main/controllers/main_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../other/controllers/other_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
    );
  }
}
