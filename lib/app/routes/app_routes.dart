part of 'app_pages.dart';

abstract class Routes{
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const SETTINGS = _Paths.SETTINGS;
  static const OTHERS = _Paths.OTHERS;
  static const TENANT = _Paths.TENANT;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths{
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const MAIN = '/main';
  static const HOME = '/home';
  static const SETTINGS = '/settings';
  static const OTHERS = '/others';
  static const TENANT = '/tenant';

}