
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/view/main_view.dart';
import '../modules/other/bindings/other_binding.dart';
import '../modules/other/views/other_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part  'app_routes.dart';



class AppPages{
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHERS,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
  ];

}