import 'package:dio/dio.dart';
import 'package:getx_mvvm/app/network/exceptions/app_exception.dart';
import 'package:getx_mvvm/app/network/exceptions/network_exception.dart';
import 'package:getx_mvvm/app/network/exceptions/timeout_exception.dart';
import 'package:getx_mvvm/flavors/build_config.dart';

// error when dio do not catch error
Exception handleGenericError(String error){
  final logger = BuildConfig.instance.envConfig.logger;
  logger.i("Generic excepton: $error");
  return AppException(message: error);
}

Exception handleDioError(DioException dioError){

  switch(dioError.type){
    case DioExceptionType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioExceptionType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioExceptionType.connectionError:
      return NetworkException("There is no internet connection");
    case DioExceptionType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioExceptionType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
  }

}

Exception _parseDioErrorResponse(DioException dioError){
  final logger = BuildConfig.instance.envConfig.logger;
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

}



//        return getErrorMessage(error.response!.data, error)
getErrorMessage(dynamic data, DioException error){
  if(data == null) return "Something went wrong";
  if(data == "") return "Something went wrong";
  try{
    if(data.containsKey("message")){
      return ApiResponseModel(
        response: error.response,
        apiMessage: data["message"],
      );
    }else if(data.containsKey("error")){
      return ApiResponseModel(
        response: error.response,
        apiMessage: data["error"],
      );
    }
  }catch(e){
    return "Something went wrong";
  }
  return "";
}

/*
    case 404:
    case 500:
    case 503:
    default:
 */