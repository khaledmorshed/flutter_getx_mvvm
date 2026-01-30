
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/base/base_controller.dart';
import '../../../../app/data/repository/auth/auth_repository.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/local/preference/preference_manager_impl.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  final AuthRepository _repository;

  LoginController(this._repository);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorMessage("Please enter both email and password");
      return;
    }

    callDataService(
      _repository.login(emailController.text, passwordController.text),
      onSuccess: (response) {
        if (response.results?.accessToken != null) {
          PreferenceManagerImpl().setString(PreferenceManager.token, response.results!.accessToken!);
          showSuccessMessage("Login Successful");
          Get.offAllNamed(Routes.HOME); 
        } else {
            showErrorMessage("Login Failed: No token received");
        }
      },
    );
  }
}
