import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/utils/token_check.dart';

import '../../../routes/app_pages.dart';
import '/app/core/base/base_controller.dart';

class SplashController extends BaseController {
  final count = 0.obs;
  void increment() => count.value++;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }

  initialize()async{
    startTimer();
  }


  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      // Map<Permission, PermissionStatus> statuses = await [Permission.notification, Permission.camera, Permission.storage, Permission.location].request();
      //
      // if(statuses[Permission.notification] == PermissionStatus.permanentlyDenied || statuses[Permission.notification] == PermissionStatus.denied){
      // }
      // if(statuses[Permission.location] == PermissionStatus.granted){
      // }else{
      //   return;
      // }

      String tenant = TokenCheck.getTenant();
      String token = TokenCheck.getUserToken();

      if(tenant.isEmpty || tenant == ""){
        Get.offAllNamed(Routes.TENANT,);
       // Navigator.pushNamedAndRemoveUntil(context, InstallationScreen.route, (route)=>false);
      }
      else{
        if(token.isEmpty || token == ""){
          // login
          Get.offAllNamed(Routes.LOGIN,);
        }else{
          Get.offAllNamed(Routes.MAIN,);
        }
      }
    });
  }

}
