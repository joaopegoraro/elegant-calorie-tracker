import 'package:elegant_calorie_tracker/calorie_tracker/bloc/calorie_tracker_bloc.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_local_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_remote_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_repository.dart';
import 'package:elegant_calorie_tracker/core/utils/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

void init() {
  //! Calorie Tracker
  // Bloc
  serviceLocator.registerFactory(
    () => CalorieTrackerBloc(
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

  //! External
  serviceLocator.registerLazySingletonAsync(
    () => SharedPreferences.getInstance(),
  );
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
