
abstract class NetworkInfo {
  /// Returns [true] if the device has an active internet connection.
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo].
/// (Note: You can use 'internet_connection_checker' or 'connectivity_plus' package here later)
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(true); // Placeholder implementation
}
