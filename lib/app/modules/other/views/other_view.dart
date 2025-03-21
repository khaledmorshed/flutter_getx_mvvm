import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '/app/core/base/base_view.dart';
import '../controllers/other_controller.dart';

class OtherView extends BaseView<OtherController> {


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
