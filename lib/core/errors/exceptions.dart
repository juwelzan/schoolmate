
class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'An unexpected server error occurred']);
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'A cache error occurred']);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'No internet connection']);
}
