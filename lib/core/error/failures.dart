import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request with Api server is canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with Api server');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown error with Api server');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response.toString());
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later');
    } else {
      return ServerFailure('Opps there was an error, Please try later');
    }
  }
}
