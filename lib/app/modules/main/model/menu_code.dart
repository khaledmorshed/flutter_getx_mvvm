import 'package:getx_mvvm/app/modules/main/model/bottom_nav_bar_item.dart';
import 'package:getx_mvvm/l10n/app_localizations.dart';

enum MenuCode {home, settings}

extension MenuPageExtension on MenuCode{
  BottomNavBarItem bottomNavBarItems(AppLocalizations appLocalization){
    switch(this){
      case MenuCode.home:
        return BottomNavBarItem(
          navBarTitle: appLocalization.bottomNavHome,
          icon: "svg/ic_home.svg",
          menuCode: MenuCode.home,
        );
      case MenuCode.settings:
        return BottomNavBarItem(
          navBarTitle: appLocalization.bottomNavSettings,
          icon: "svg/ic_settings.svg",
          menuCode: MenuCode.settings,
        );
    }
  }
}
