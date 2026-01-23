import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '/app/core/base/base_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
   SplashView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Other");
  }


  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'OtherView',
      ),
    );
  }
}
