import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/base/base_view.dart';
import 'package:getx_mvvm/app/modules/home/views/home_view.dart';
import 'package:getx_mvvm/app/modules/main/controllers/main_controller.dart';
import 'package:getx_mvvm/app/modules/main/view/bottom_nav_bar.dart';
import 'package:getx_mvvm/app/modules/other/views/other_view.dart';

import '../../settings/views/settings_view.dart';
import '../model/menu_code.dart' show MenuCode;

class MainView extends BaseView<MainController>{

  @override
  PreferredSizeWidget? appBar(BuildContext context)=>null;

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(()=>
        getPageOnSelectedMenu(controller.selectedMenuCode)
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onBottomNavItemSelected: controller.onMenuSelected);
  }

  final HomeView homeView = HomeView();
  SettingsView? settingsView;
  Widget getPageOnSelectedMenu(MenuCode menuCode){
    switch(menuCode){
      case MenuCode.home:
        return homeView;
      case MenuCode.settings:
        return settingsView ?? SettingsView();
      default:
        return OtherView();
    }
  }

}