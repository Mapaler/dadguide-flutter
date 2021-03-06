import 'dart:io' show HttpHeaders;

import 'package:dadguide2/components/db/dadguide_database.dart';
import 'package:dadguide2/components/db/local_database.dart';
import 'package:dadguide2/components/images/cache.dart';
import 'package:dadguide2/components/notifications/notifications.dart';
import 'package:dadguide2/components/utils/version_info.dart';
import 'package:dadguide2/data_dadguide/tables.dart';
import 'package:dadguide2/data_local/local_tables.dart';
import 'package:dadguide2/services/api.dart';
import 'package:dadguide2/services/device_utils.dart';
import 'package:dadguide2/services/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Global service locator singleton.
final getIt = GetIt.instance;

/// Initialize global singleton dependencies and register with getIt.
Future<void> initializeServiceLocator(
    {bool useDevEndpoints = false, bool logHttpRequests = false}) async {
  getIt.registerSingleton<PermanentCacheManager>(PermanentCacheManager());
  var dio = Dio();
  if (logHttpRequests) {
    dio.interceptors.add(LogInterceptor());
  }
  getIt.registerSingleton(dio);

  var endpoints = useDevEndpoints ? DevEndpoints() : ProdEndpoints();
  getIt.registerSingleton<Endpoints>(endpoints);

  var apiClient = ApiClient(endpoints, dio);
  getIt.registerSingleton<ApiClient>(apiClient);

  var versionInfo = await getVersionInfo();
  getIt.registerSingleton(versionInfo);

  var deviceInfo = await createDeviceInfo();
  getIt.registerSingleton(deviceInfo);

  dio.options.headers = <String, String>{
    HttpHeaders.userAgentHeader:
        'DadGuide v${versionInfo.projectCode} - ${versionInfo.platformVersion}',
  };

  // Does the appropriate registration; not actually using the object yet though.
  NotificationSingleton();
  var notificationManager = NotificationManager();
  getIt.registerSingleton(notificationManager);

  final googleSignIn = GoogleSignIn(scopes: ['email']);
  getIt.registerSingleton(googleSignIn);

  var localDb = await createLocalStorageDatabase();
  getIt.registerSingleton(localDb);
  getIt.registerSingleton(BuildsDao(localDb));
}

/// Try to initialize DB dependencies and register them with getIt.
///
/// This may fail if the database has not been downloaded.
Future<void> tryInitializeServiceLocatorDb() async {
  var db = await DatabaseHelper.instance.database;
  if (db == null) {
    Fimber.e('Could not register db, as it was null');
    return;
  }
  getIt.registerSingleton<DadGuideDatabase>(db);
  getIt.registerSingleton<DungeonsDao>(db.dungeonsDao);
  getIt.registerSingleton<EggMachinesDao>(db.eggMachinesDao);
  getIt.registerSingleton<ExchangesDao>(db.exchangesDao);
  getIt.registerSingleton<MonstersDao>(db.monstersDao);
  getIt.registerSingleton<MonsterSearchDao>(db.monsterSearchDao);
  getIt.registerSingleton<ScheduleDao>(db.scheduleDao);
}
