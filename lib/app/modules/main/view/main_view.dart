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

  final List<Widget> _pages = [
    HomeView(),
    SettingsView(),
    OtherView(),
  ];

  @override
  PreferredSizeWidget? appBar(BuildContext context)=>null;

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => IndexedStack(
        index: _getSelectedIndex(controller.selectedMenuCode),
        children: _pages.asMap().entries.map((entry) {
            int idx = entry.key;
            Widget page = entry.value;
            // Use Nested Key based on index (1-based for GetX nested keys to avoid 0/root issues if any)
            // Home=1, Settings=2, Other=3
            int nestedKey = idx + 1; 

            return Navigator(
              key: Get.nestedKey(nestedKey),
              onGenerateRoute: (settings) => _onGenerateRoute(settings, page),
            );
          }).toList(),
      )),
    );
  }

  Route? _onGenerateRoute(RouteSettings settings, Widget rootPage) {
     // If root path ('/') or specific route for this tab, show the rootPage
     if (settings.name == '/' || _isRootRoute(settings.name)) {
         return GetPageRoute(
            page: () => rootPage,
            // You might need logic to determine correct binding for rootPage if not auto-injected
            // For now, let's assume Bindings are handled or we need a map for them too.
            // A safer way is to rely on GetPage lookup even for root if possible, or manual.
            binding: _getBindingForPage(rootPage),
         );
     }

      // Dynamic Route Generation from AppPages
      final GetPage? route = AppPages.routes.firstWhereOrNull(
        (GetPage page) => page.name == settings.name,
      );

      if (route != null) {
        return GetPageRoute(
          page: route.page,
          binding: route.binding,
          settings: settings,
        );
      }
      
      return null;
  }

  // Helper to check if route is a root route (convention)
  bool _isRootRoute(String? name) {
     return name == Routes.HOME || name == Routes.SETTINGS || name == Routes.OTHERS;
  }

  Bindings? _getBindingForPage(Widget page) {
    if (page is HomeView) return HomeBinding();
    if (page is SettingsView) return SettingsBinding();
    // OtherView binding can be here if needed
    return null;
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
    return WillPopScope(
      onWillPop: () async {
        // Logic to handle back navigation for nested navigators
        int selectedIndex = _getSelectedIndex(controller.selectedMenuCode);
        int nestedKey = selectedIndex + 1;

        final navigator = Get.nestedKey(nestedKey);
        if (navigator?.currentState?.canPop() == true) {
          navigator!.currentState!.pop();
          return false; 
        }
        
        return true; 
      },
      child: Scaffold(
        key: controller.scaffoldKey, 
        backgroundColor: pageBackGroundColor(),
        appBar: appBar(context),
        body: pageContent(context),
        bottomNavigationBar: bottomNavigationBar(),
        drawer: drawer(),
        bottomSheet: bottomSheet() != null ? Wrap(children: [bottomSheet()!]) : null,
        floatingActionButton: floatingActionButton(),
      ),
    );
  }

  int _getSelectedIndex(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.home:
        return 0;
      case MenuCode.settings:
        return 1;
      default:
        return 1; // Default to index 1 or 2 as needed
    }
  }

}