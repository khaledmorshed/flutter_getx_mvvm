
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/base/base_view.dart';
import '../../../../app/core/widgets/custom_text_form_field.dart';
import '../controllers/client_controller.dart';

class CreateClientView extends GetView<ClientController> {
   const CreateClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Client")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Full Name",
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.phoneController,
                hintText: "Phone Number",
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "Email (Optional)",
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.addressController,
                hintText: "Address (Optional)",
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  controller.createClient();
                },
                child: const Text("Create Client"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
