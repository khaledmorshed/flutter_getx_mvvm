import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/base/base_controller.dart';
import 'package:getx_mvvm/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.home.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}