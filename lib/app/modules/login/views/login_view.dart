import 'package:flutter/material.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../controllers/login_controller.dart';
import '/app/core/base/base_view.dart';

class LoginView extends BaseView<LoginController> {
  LoginView() {

  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Text("Login")
      ],
    );
  }
}
