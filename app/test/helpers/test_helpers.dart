import 'package:app/core/core.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_helpers.mocks.dart';

/// Every time you create a new implementation (class),
/// then you should be writing tests that exercise that new implementation.
/// Since parts of the functionality (your "gaps") are implemented within each subclass, this is absolutely necessary;
/// the output of each of the inherited methods may (and probably should) be different for each new implementation.
@GenerateMocks(
  [],
  customMocks: [
    MockSpec<SharedPreferences>(onMissingStub: OnMissingStub.returnDefault),
  ],
)
Dio _fakeDioImplementation({String? url, Map<String, dynamic>? requestData, Map<String, dynamic>? data}) {
  final fakeDio = DioAdapter(dio: Dio());
  fakeDio.onGet(url ?? "/", queryParameters: requestData, (server) => server.reply(200, data));
  fakeDio.onPost(url ?? "/", data: requestData, (server) => server.reply(200, data));
  fakeDio.onDelete(url ?? "/", data: requestData, (server) => server.reply(200, data));
  fakeDio.onPut(url ?? "/", data: requestData, (server) => server.reply(200, data));
  return fakeDio.dio;
}

/// ================================ repository ===========================

Object registerDemoRepository() {
  _removeRegistrationIfExists<Object>();
  Object object = Object();
  getIt.registerLazySingleton<Object>(() => object);
  return object;
}

/// ====================== services ==============================

void registerRepositories() {
  registerDemoRepository();
}

void registerServices() {}

void registerDependencies() {
  registerRepositories();
  registerServices();
}

void unRegisterDependencies() {
  getIt.unregister<Object>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
}
