import 'package:dio/dio.dart';

/// {@template request_failure}
/// Thrown if an exception occurs while making an 'http' request
/// {@endtemplate}
class RequestException implements Exception {
  /// {@macro request_failure}
  const RequestException(this.error, this.statusCode);

  /// Error field with date
  final DioError error;

  /// The status code of the response.
  final int? statusCode;
}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}
