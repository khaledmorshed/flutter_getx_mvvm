
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/modules/main/controllers/main_controller.dart';
import 'package:getx_mvvm/app/routes/app_pages.dart';
import '../../../../app/core/base/base_view.dart';
import '../controllers/client_controller.dart';
import 'create_client_view.dart';

class ClientView extends BaseView<ClientController> {
  ClientView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
            // Open Root Drawer
            try {
              Get.find<MainController>().openDrawer();
            } catch (e) {
              print("MainController not found");
            }
        },
      ),
      title: const Text('Clients'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
             // Use nested ID 1 to keep bottom bar visible
            Get.toNamed(Routes.CREATE_CLIENT, id: 1);
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      if (controller.clientList.isEmpty && controller.page.value == 1) {
          // You might want to handle loading state more gracefully here
          // but BaseView typically handles initial loading if connected properly.
          // For now, let's just show empty if not loading.
          return const Center(child: Text("No Clients Found"));
      }

      return ListView.separated(
        controller: controller.scrollController,
        itemCount: controller.clientList.length + (controller.hasMore.value ? 1 : 0),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          if (index == controller.clientList.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final client = controller.clientList[index];
          return ListTile(
            title: Text(client.client ?? "Unknown"),
            subtitle: Text(client.phone ?? "No Phone"),
            trailing: Text(client.totalDue ?? "0.0"),
          );
        },
      );
    });
  }
}
