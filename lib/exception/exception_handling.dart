import 'dart:convert';

import 'package:flutter_bil_hikmah/exception/exception.dart';
import 'package:http/http.dart';

ErrorType errorTypeFromStatusCode(int statusCode) {
  switch (statusCode) {
    case 400:
      return ErrorType.badRequest;
    case 401:
      return ErrorType.unauthorized;
    case 402:
      return ErrorType.paymentRequired;
    case 403:
      return ErrorType.forbidden;
    case 404:
      return ErrorType.notFound;
    case 405:
      return ErrorType.methodNotAllowed;
    case 406:
      return ErrorType.notAcceptable;
    case 500:
      return ErrorType.internalServerError;
    case 501:
      return ErrorType.notImplemented;
    case 502:
      return ErrorType.badGateway;
    default:
      return ErrorType.unknown;
  }
}

AppException errorResponse(ErrorType type) {
  switch (type) {
    case ErrorType.badRequest:
      return BadRequest();
    case ErrorType.unauthorized:
      return Unauthorized();
    case ErrorType.paymentRequired:
      return PaymentRequired();
    case ErrorType.forbidden:
      return Forbidden();
    case ErrorType.notFound:
      return NotFound();
    case ErrorType.methodNotAllowed:
      return MethodNotAllowed();
    case ErrorType.notAcceptable:
      return NotAcceptable();
    case ErrorType.internalServerError:
      return InternalServerError();
    case ErrorType.notImplemented:
      return NotImplemented();
    case ErrorType.badGateway:
      return BadGateway();
    default:
      return UnknownException();
  }
}

class ExceptionHandling {
  static void handelAPIError({
    required int desireStatusCode,
    required Response response,
  }) {
    if (desireStatusCode == response.statusCode) {
      return;
    }
    try {
      ErrorType _errorType = errorTypeFromStatusCode(response.statusCode);
      if (_errorType == ErrorType.unknown) {
        var jsonData = json.decode(response.body);
        var errorMsg = jsonData['error'];
        var errorMsg2 = jsonData['message'];
        throw UnknownException(
          message: errorMsg ?? errorMsg2,
        );
      } else {
        throw errorResponse(_errorType);
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }
}
