import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../l10n/app_localizations.dart';
import '/flavors/build_config.dart';

//mixin does not force to implement in child class for its(mixin) all method and property which
// abstract class does.Abstract class force to child class for implementing all its property and method
mixin BaseWidgetMixin on StatelessWidget {
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;
  final Logger logger = BuildConfig.instance.envConfig.logger;


  late ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  Widget build(BuildContext context) {
    _theme = context.theme;

    return Container(
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
