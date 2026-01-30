import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/base/base_view.dart';
import 'package:getx_mvvm/app/core/widgets/app_drawer.dart';
import 'package:getx_mvvm/app/modules/home/views/home_view.dart';
import 'package:getx_mvvm/app/modules/home/bindings/home_binding.dart';
import 'package:getx_mvvm/app/modules/client/views/client_view.dart';
import 'package:getx_mvvm/app/modules/client/views/create_client_view.dart';
import 'package:getx_mvvm/app/modules/client/bindings/client_binding.dart';
import 'package:getx_mvvm/app/modules/main/controllers/main_controller.dart';
import 'package:getx_mvvm/app/modules/main/view/bottom_nav_bar.dart';
import 'package:getx_mvvm/app/modules/other/views/other_view.dart';
import 'package:getx_mvvm/app/modules/settings/bindings/settings_binding.dart';
import 'package:getx_mvvm/app/routes/app_pages.dart';

import '../../settings/views/settings_view.dart';
import '../model/menu_code.dart' show MenuCode;

class MainView extends BaseView<MainController>{

  @override
  PreferredSizeWidget? appBar(BuildContext context)=>null;

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => IndexedStack(
        index: _getSelectedIndex(controller.selectedMenuCode),
        children: [
          // Home Tab with Nested Navigation
          Navigator(
            key: Get.nestedKey(1),
            onGenerateRoute: (settings) {
              if (settings.name == '/' || settings.name == Routes.HOME) {
                 return GetPageRoute(
                  page: () => HomeView(),
                  binding: HomeBinding(),
                );
              }
              // Handle other routes inside Home Tab
               if (settings.name == Routes.CLIENT) {
                 return GetPageRoute(
                  page: () => ClientView(),
                  binding: ClientBinding(),
                );
              }
               if (settings.name == Routes.CREATE_CLIENT) {
                 return GetPageRoute(
                  page: () => CreateClientView(),
                  binding: ClientBinding(), // Or specific binding
                );
              }
              return GetPageRoute(
                page: () => SettingsView(),
                binding: SettingsBinding(), // Or specific binding
              );
            },
          ),
          
          //Settings Tab (Example of simple view, can also be a Navigator if needed)
           Navigator(
            key: Get.nestedKey(2),
             onGenerateRoute: (settings) {
               return GetPageRoute(
                 page: () => settingsView ?? SettingsView(),
                 binding: SettingsBinding(),
               );
             }
           ),

          // Other Tab
          OtherView(),
        ],
      )),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onBottomNavItemSelected: controller.onMenuSelected);
  }

  @override
  Widget? drawer() {
    return const AppDrawer();
  }

  @override
  Widget pageScaffold(BuildContext context) {
    // Override pageScaffold to explicitly use the controller's key for the root scaffold
    return Scaffold(
      key: controller.scaffoldKey, // Use key from controller
      backgroundColor: pageBackGroundColor(),
      appBar: appBar(context),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      bottomSheet: bottomSheet() != null ? Wrap(children: [bottomSheet()!]) : null,
      floatingActionButton: floatingActionButton(),
    );
  }


  final HomeView homeView = HomeView();
  SettingsView? settingsView;

  int _getSelectedIndex(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.home:
        return 0;
      case MenuCode.settings:
        return 1;
      default:
        return 2;
    }
  }

}