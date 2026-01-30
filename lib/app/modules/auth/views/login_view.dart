
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/base/base_view.dart';
import '../../../../app/core/widgets/custom_text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('Login'),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: controller.emailController,
            hintText: "Email or Phone",
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: controller.passwordController,
            hintText: "Password",
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              controller.onLogin();
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
