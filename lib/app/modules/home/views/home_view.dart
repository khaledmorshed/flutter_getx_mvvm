import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {

  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'GetX Templates ',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Text("Home")
      ],
    );
  }
}
