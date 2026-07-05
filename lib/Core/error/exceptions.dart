import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;
  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
    case DioExceptionType.transformTimeout:
      throw ServerException(
        errModel: ErrorModel.fromJson(
          e.response?.data ?? {'message': 'Connection error occurred'},
        ),
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad Request
        case 401: // Unauthorized
        case 403: // Forbidden
        case 404: // Not Found
        case 409: // Conflict
        case 422: // Validation Error
        case 500: // Internal Server Error
        case 502: // Bad Gateway
        case 503: // Service Unavailable
        case 504: // Gateway Timeout
          throw ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        default:
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response?.data ?? {'message': 'Unexpected server error'},
            ),
          );
      }
  }
}