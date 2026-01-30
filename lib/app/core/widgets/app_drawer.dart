import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/modules/main/controllers/main_controller.dart';
import 'package:getx_mvvm/app/modules/main/model/menu_code.dart';
import 'package:getx_mvvm/app/routes/app_pages.dart';

class AppDrawer extends GetView<MainController> {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              controller.onMenuSelected(MenuCode.home);
              Get.back(); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // controller.onMenuSelected(MenuCode.settings);
              //  Get.back(); // Close drawer

              Get.back(); // Close drawer first
              // Ensure we are on Home tab to use its nested navigator
              controller.onMenuSelected(MenuCode.settings);
              // Navigate using nested ID 1
              Get.toNamed(Routes.SETTINGS, id: 1);
            },
          ),
               ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Clients'),
             onTap: () {
                Get.back(); // Close drawer first
                // Ensure we are on Home tab to use its nested navigator
                controller.onMenuSelected(MenuCode.home); 
                // Navigate using nested ID 1
                Get.toNamed(Routes.CLIENT, id: 1);
            },
          ),
        ],
      ),
    );
  }
}
