import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/bindings/initial_bindings.dart';
import 'package:getx_mvvm/app/core/values/app_languages.dart';
import 'package:getx_mvvm/app/data/local/preference/preference_manager.dart';
import 'package:getx_mvvm/app/data/local/preference/preference_manager_impl.dart';
import 'package:getx_mvvm/app/routes/app_pages.dart';
import 'package:getx_mvvm/flavors/build_config.dart';
import 'package:getx_mvvm/flavors/env_config.dart';
import '../l10n/app_localizations.dart';
import 'core/base/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  bool _didLanguageSet = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.envConfig;
  final PreferenceManager _preferenceManager = PreferenceManagerImpl();


  @override
  Widget build(BuildContext context) {
    _localizeApp();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme:  AppThemeData().getTheme(),
      supportedLocales: _getSupportedLocal(),
    );
  }

  _localizeApp(){
    String appLanguage = _preferenceManager.getString(
      PreferenceManager.language,
      defaultValue: Platform.localeName
    );
    if(appLanguage.contains(AppLanguages.en.name)){
      appLanguage = AppLanguages.en.name;
    }
    if(!widget._didLanguageSet){
      _envConfig.logger.i("AppLanguage: $appLanguage");
      WidgetsBinding.instance.addPostFrameCallback((_){
        widget._didLanguageSet = true;
        Get.updateLocale(Locale(appLanguage));
      });
    }
  }

  List<Locale> _getSupportedLocal(){
    return AppLanguages.values.map((language)=>Locale(language.name)).toList();
  }

}
