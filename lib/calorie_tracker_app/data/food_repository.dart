import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/utils/network_info.dart';
import 'datasources/food_local_data_source.dart';
import 'datasources/food_remote_data_source.dart';
import 'food_model.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodModel>>> getFood(String query);
  Future<Either<Failure, List<FoodModel>>> getSavedFoods();
  Future<void> emptySavedFoodList();
  Future<void> removeSavedFood(int index);
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

  @override
  Future<void> removeSavedFood(int index) async {
    await localDataSource.removeSavedFood(index);
  }
}
