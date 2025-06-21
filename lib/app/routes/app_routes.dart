part of 'app_pages.dart';

abstract class Routes{
  Routes._();

  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const SETTINGS = _Paths.SETTINGS;
  static const OTHERS = _Paths.OTHERS;
}

abstract class _Paths{
  static const MAIN = '/main';
  static const HOME = '/home';
  static const SETTINGS = '/settings';
  static const OTHERS = '/others';

}