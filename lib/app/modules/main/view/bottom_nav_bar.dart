import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/base/base_widget_mixin.dart';
import 'package:getx_mvvm/app/core/widgets/custom_asset_image_widget.dart';
import 'package:getx_mvvm/app/modules/main/model/bottom_nav_bar_item.dart';
import 'package:getx_mvvm/app/modules/main/model/menu_code.dart';

import '../../../core/values/app_values.dart';
import '../controllers/bottom_nav_bar_controller.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menucode);

class BottomNavBar extends StatelessWidget with BaseWidgetMixin{

  final OnBottomNavItemSelected onBottomNavItemSelected;
  
  BottomNavBar({
    super.key,
    required this.onBottomNavItemSelected,
});

  final bottomNavBarController = BottomNavBarController();
  final Key bottomNavBarKey = GlobalKey();
  
  @override
  Widget body(BuildContext context) {
    
    List<BottomNavBarItem> navBarItems = _getNavBarItems();
    
    return Obx(()=>
        BottomNavigationBar(
          key: bottomNavBarKey,
          items: _navBarItemBuilder(navBarItems),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
          selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
          currentIndex: bottomNavBarController.selectedIndex,
          onTap: (index){
            bottomNavBarController.updateSelectedIndex(index);
            onBottomNavItemSelected(navBarItems[index].menuCode);
          },
        ),
    );
  }

  
  List<BottomNavigationBarItem> _navBarItemBuilder(List<BottomNavBarItem> navItemList){
    return navItemList.map((BottomNavBarItem navItem) => _getBottomNavigationBarItem(
      navItem,
      navItemList.indexOf(navItem) == bottomNavBarController.selectedIndex,
    )).toList();
  }
  
  BottomNavigationBarItem _getBottomNavigationBarItem(BottomNavBarItem navItem, bool isSelected){
    return BottomNavigationBarItem(
      icon: CustomAssetImageWidget(
        dynamicChild: navItem.icon,
        height: AppValues.iconDefaultSize,
        width: AppValues.iconDefaultSize,
        color: isSelected ? theme.bottomNavigationBarTheme.selectedItemColor : theme.bottomNavigationBarTheme.unselectedItemColor,
      ),
      label: navItem.navBarTitle,
      tooltip: navItem.navBarTitle,
    );
  }
  
 List<BottomNavBarItem> _getNavBarItems(){
    return MenuCode.values.map((e)=> e.bottomNavBarItems(appLocalization)).toList();
  }
  
}