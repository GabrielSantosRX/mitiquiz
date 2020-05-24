import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mitiquiz/core/constants.dart' as constants;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:mitiquiz/core/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //! Core
  getIt.registerLazySingleton<IConnectivity>(() => Connectivity(getIt()));

  //! External
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final box = await Hive.openBox(constants.hiveBox);
  getIt.registerLazySingleton(() => box);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DataConnectionChecker());

  //! Features
  // Controllers
}
