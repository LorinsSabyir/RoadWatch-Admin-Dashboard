import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _navOpen = await secureStorage.getBool('ff_navOpen') ?? _navOpen;
    });
    await _safeInitAsync(() async {
      _navTestOpen =
          await secureStorage.getBool('ff_navTestOpen') ?? _navTestOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
    secureStorage.setBool('ff_navOpen', value);
  }

  void deleteNavOpen() {
    secureStorage.delete(key: 'ff_navOpen');
  }

  bool _navTestOpen = false;
  bool get navTestOpen => _navTestOpen;
  set navTestOpen(bool value) {
    _navTestOpen = value;
    secureStorage.setBool('ff_navTestOpen', value);
  }

  void deleteNavTestOpen() {
    secureStorage.delete(key: 'ff_navTestOpen');
  }

  bool _searchIsActive = false;
  bool get searchIsActive => _searchIsActive;
  set searchIsActive(bool value) {
    _searchIsActive = value;
  }

  /// Stores difference of citations in last month and this month for analytics
  /// purposes
  double _ThisMonthPercentage = 0.0;
  double get ThisMonthPercentage => _ThisMonthPercentage;
  set ThisMonthPercentage(double value) {
    _ThisMonthPercentage = value;
  }

  /// Stores difference of citations in last day and this day for analytics
  /// purposes
  double _ThisDayPercentage = 0.0;
  double get ThisDayPercentage => _ThisDayPercentage;
  set ThisDayPercentage(double value) {
    _ThisDayPercentage = value;
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
  }

  final _finesPageCacheManager = StreamRequestManager<List<ViolationRecord>>();
  Stream<List<ViolationRecord>> finesPageCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ViolationRecord>> Function() requestFn,
  }) =>
      _finesPageCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFinesPageCacheCache() => _finesPageCacheManager.clear();
  void clearFinesPageCacheCacheKey(String? uniqueKey) =>
      _finesPageCacheManager.clearRequest(uniqueKey);

  final _apprePlacePageCacheManager =
      StreamRequestManager<List<ApprePlacesRecord>>();
  Stream<List<ApprePlacesRecord>> apprePlacePageCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ApprePlacesRecord>> Function() requestFn,
  }) =>
      _apprePlacePageCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearApprePlacePageCacheCache() => _apprePlacePageCacheManager.clear();
  void clearApprePlacePageCacheCacheKey(String? uniqueKey) =>
      _apprePlacePageCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
