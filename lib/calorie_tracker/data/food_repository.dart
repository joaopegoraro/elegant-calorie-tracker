import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/core/utils/network_info.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_local_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_remote_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodModel>>> getFood(String query);
  Future<Either<Failure, List<FoodModel>>> getSavedFoods();
  Future<void> emptySavedFoodList();
}

class DataFoodRepository implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  final FoodLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DataFoodRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<FoodModel>>> getFood(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFood = await remoteDataSource.getFood(query);
        localDataSource.saveFoods(remoteFood);
        return Right(remoteFood);
      } on ServerException {
        return Left(ServerFailure());
      } on FoodNotFoundException {
        return Left(NotFoundFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FoodModel>>> getSavedFoods() async {
    try {
      final List<FoodModel> localList = await localDataSource.getSavedFoods();
      return Right(localList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> emptySavedFoodList() async {
    await localDataSource.emptySavedFoodList();
  }
}
