import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'calorie_tracker_app/calorie_tracker_manager.dart';
import 'calorie_tracker_app/data/datasources/food_local_data_source.dart';
import 'calorie_tracker_app/data/datasources/food_remote_data_source.dart';
import 'calorie_tracker_app/data/food_repository.dart';
import 'core/utils/network_info.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );

  //! Calorie Tracker
  // Provider
  serviceLocator.registerFactory<CalorieTrackerManager>(
    () => CalorieTrackerManager(
      repository: serviceLocator(),
    ),
  );
  // Repositories
  serviceLocator.registerLazySingleton<FoodRepository>(
    () => DataFoodRepository(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  // Data Sources
  serviceLocator.registerLazySingleton<FoodLocalDataSource>(
    () => SharedPrefFoodLocalDataSource(
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FoodRemoteDataSource>(
    () => CalorieNinjasFoodRemoteDataSource(
      client: serviceLocator(),
    ),
  );

  //! Core
  // Network Info
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => InternetConnectionCheckerNetworkInfo(
      serviceLocator(),
    ),
  );
}
