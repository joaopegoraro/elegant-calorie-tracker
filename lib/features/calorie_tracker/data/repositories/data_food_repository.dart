import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/core/network/network_info.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/datasources/food_local_data_source.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/datasources/food_remote_data_source.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/repositories/food_repository.dart';

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
  Future<Either<Failure, Food>> getFood(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFood = await remoteDataSource.getFood(query);
        localDataSource.saveFood(remoteFood);
        return Right(remoteFood);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Food>>> getSavedFoods() async {
    try {
      final List<Food> localList = await localDataSource.getSavedFoods();
      return Right(localList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
