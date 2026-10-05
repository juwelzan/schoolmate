import 'package:schoolmate/core/file_path.dart';

/// A base abstract class for all API network calls.
/// This can be implemented using Dio, Http, or any other networking package.
abstract class ApiClient {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
