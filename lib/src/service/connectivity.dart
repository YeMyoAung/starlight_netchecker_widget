part of starlight_netchecker_widget;

class _Connectivity {
  bool? _lastedValue;

  final Connectivity _connectivity = Connectivity();

  Future<bool?> _init() async {
    _isOnline(await _connectivity.checkConnectivity());
    return _lastedValue;
  }

  bool? _isOnline(ConnectivityResult value) {
    _lastedValue = (value != ConnectivityResult.none);
    return _lastedValue;
  }
}
