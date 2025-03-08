import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_mvvm/app/data/local/preference/preference_manager.dart';
import 'package:getx_mvvm/flavors/build_config.dart';
import 'package:getx_mvvm/flavors/env_config.dart';
import 'package:getx_mvvm/flavors/environment.dart';

import 'app/my_app.dart';

void main()async {

  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX MVVM",
    baseUrl: "https://",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );

  await GetStorage.init(PreferenceManager.preferenceDataBaseName);

  runApp(MyApp());
}
