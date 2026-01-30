
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/core/base/base_view.dart';
import '../../main/controllers/main_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
            // Find MainController to open the root drawer
            try {
              Get.find<MainController>().openDrawer();
            } catch (e) {
              print("MainController not found: $e");
            }
        },
      ),
      title: const Text('Dashboard'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Logout logic will go here
            Get.offAllNamed('/login');
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 80, color: Colors.blue),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate within the nested navigator (ID 1 for Home Tab)
             // Get.toNamed(Routes.CLIENT, id: 1);
              Get.toNamed(Routes.CLIENT, id: 1);
            },
            child: Text("Go to Clients"),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome to ERP Home',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
