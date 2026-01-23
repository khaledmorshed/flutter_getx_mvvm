import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/base/base_controller.dart';
import 'package:getx_mvvm/app/core/base/page_state.dart';
import 'package:getx_mvvm/app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:getx_mvvm/app/core/widgets/custom_snackbar.dart';
import 'package:getx_mvvm/flavors/build_config.dart';
import 'package:getx_mvvm/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
abstract class BaseView<Controller extends BaseController> extends GetView<Controller>{
  BaseView({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.envConfig.logger;

  late ThemeData _theme;

  ThemeData get theme => _theme;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _theme = context.theme;
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.loading
              ? _showLoading() : Container()),
          Obx(()=> controller.errorMessage.isNotEmpty
              ? showErrorSnackBar(controller.errorMessage) : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context){
    return AnnotatedRegion(
      value: systemUiOverlayStyle ?? theme.appBarTheme.systemOverlayStyle ??
          SystemUiOverlayStyle(
            //Status bar color for android
            statusBarColor: statusBarColor(),
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        child: Material(
          color: Colors.transparent,
          child: pageScaffold(context),
        ),
    );
  }

  Widget pageScaffold(BuildContext context){
    return Scaffold(
      key: globalKey,
      //sets ios status bar color
      backgroundColor: pageBackGroundColor(),
      appBar: appBar(context),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      bottomSheet: _bottomSheet(),
      floatingActionButton: floatingActionButton(),
    );
  }

  Color statusBarColor() {
    return theme.scaffoldBackgroundColor;
  }

  Color pageBackGroundColor(){
    return theme.scaffoldBackgroundColor;
  }

  Widget pageContent(BuildContext context){
    return SafeArea(
        child: GestureDetector(
          onTap: _onTapGestureDetector,
          child: body(context),
        ),
    );
  }

  void _onTapGestureDetector() {
    if (activeGestureDetector) {
      closeKeyboard();
    }
  }
  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget? _bottomSheet() {
    return Wrap(
      children: [
        bottomSheet() ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget? bottomSheet() {
    return null;
  }

  Widget showErrorSnackBar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      customSnackBar(message);
    });
    return Container();
  }

  Widget _showLoading() {
    return CustomCircularProgressIndicator();
  }

  SystemUiOverlayStyle? get systemUiOverlayStyle{
    return null;
  }

  bool get activeGestureDetector => true;

  void closeKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}