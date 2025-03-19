import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_mvvm/app/network/dio_provider.dart';
import 'package:getx_mvvm/app/network/error_handlers.dart';
import 'package:getx_mvvm/flavors/build_config.dart';

import '../../network/exceptions/base_exception.dart';

abstract class BaseRemoteSource{
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = BuildConfig.instance.envConfig.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api)async{
    try{
     Response<T> response = await api;
     if (response.statusCode != HttpStatus.ok ) {
       // TODO
     }
     return response;
    } on DioException catch(dioException){
      Exception exception = handleDioError(dioException);
      logger.e("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    }catch(error){
      logger.e("Generic error: >>>>>>> $error");
      if(error is BaseException){
        rethrow;
      }
      throw handleGenericError("$error");
    }
  }

}