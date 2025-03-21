import 'package:getx_mvvm/app/modules/main/model/menu_code.dart';

class BottomNavBarItem{
  final String navBarTitle;
  final String icon;
  final MenuCode menuCode;

  BottomNavBarItem({
    required this.navBarTitle,
    required this.icon,
    required this.menuCode,
  });
}