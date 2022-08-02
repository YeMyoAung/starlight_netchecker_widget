part of starlight_netchecker_widget;

class _NetChecker with _Connectivity {
  final StreamController<bool?> _netController = StreamController.broadcast();

  Stream<bool?> get _netStream => _netController.stream;
  Sink<bool?> get _netSink => _netController.sink;

  StreamSubscription<ConnectivityResult>? _streamSubscription;

  static _NetChecker? _instance;

  static _NetChecker get _get {
    _instance ??= _NetChecker._();
    return _instance!;
  }

  _NetChecker._() {
    _init().then((value) {
      _netController.sink.add(value);
      _connectivity.onConnectivityChanged.listen((event) {
        _netSink.add(_isOnline(event));
      });
    });
  }

  void reset() => _netSink.add(_lastedValue);

  ///ToDo:: Determine
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _netController.close();
  }
}
