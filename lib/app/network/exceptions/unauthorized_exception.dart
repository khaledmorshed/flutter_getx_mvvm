import 'dart:io';

import '/app/network/exceptions/base_api_exception.dart';

class UnAuthorizedException extends BaseApiException {
  UnAuthorizedException(String message) :
      super(
        httpCode: HttpStatus.unauthorized,
        message: message,
        status: "unauthorized",
      );
}
