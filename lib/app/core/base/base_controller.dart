import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:getx_mvvm/app/core/base/page_state.dart';
import 'package:getx_mvvm/app/network/exceptions/service_unavailable_exception.dart';
import 'package:getx_mvvm/flavors/build_config.dart';
import 'package:getx_mvvm/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart' show JsonFormatException;
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/unauthorized_exception.dart';

abstract class BaseController extends GetxController{
  final Logger logger = BuildConfig.instance.envConfig.logger;
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;
  final logoutController = false.obs;

  //reload the page
  final _refreshController = false.obs;
  refreshPage(bool refresh)=> _refreshController(refresh);

  //control page state
  final _pageStateController = PageState.defaultState.obs;
  PageState get pageState => _pageStateController.value;
  updatePageState(PageState state)=>_pageStateController(state);
  resetPageState()=>_pageStateController(PageState.defaultState);

  //loading
  showLoading()=> updatePageState(PageState.loading);
  hideLoading()=> resetPageState();

  //message
  final _messageController = "".obs;
  String get message => _messageController.value;
  showMessage(String msg)=> _messageController(msg);

  //error message
  final _errorMessageController = "".obs;
  String get errorMessage => _messageController.value;
  showErrorMessage(String msg){
    _errorMessageController(msg);
  }

  //success message
  final _successMessageController = ''.obs;
  String get successMessage => _messageController.value;
  showSuccessMessage(String msg) => _successMessageController(msg);

  dynamic callDataService<T>(
  Future<T> future,
  {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  })async{
    Exception? exception;

    onStart == null ? showLoading() : onStart();

    try{
      final T response = await future;

      if(onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch(error){
      exception = error;
      showErrorMessage(error.message);
    } on UnAuthorizedException catch(error){
      exception = error;
      showErrorMessage(error.message);
    } on TimeoutException catch(error){
      exception = error;
      showErrorMessage(error.message ?? "Timeout exception");
    }  on NetworkException catch (error) {
      exception = error;
      showErrorMessage(error.message);
    } on JsonFormatException catch (error) {
      exception = error;
      showErrorMessage(error.message);
    } on NotFoundException catch (error) {
      exception = error;
      showErrorMessage(error.message);
    } on ApiException catch (error) {
      exception = error;
    } on AppException catch (error) {
      exception = error;
      showErrorMessage(error.message);
    } catch (error) {
      exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if(onError != null) onError(exception);

    onComplete == null ? hideLoading() : onComplete();

  }



  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageStateController.close();
    super.onClose();
  }

}