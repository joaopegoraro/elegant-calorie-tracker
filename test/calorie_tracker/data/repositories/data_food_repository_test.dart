import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:elegant_calorie_tracker/core/network/network_info.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_local_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_remote_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/models/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/repositories/food_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'data_food_repository_test.mocks.dart';

@GenerateMocks([NetworkInfo, FoodLocalDataSource, FoodRemoteDataSource])
void main() {
  late DataFoodRepository repository;
  late MockFoodRemoteDataSource mockRemoteDataSource;
  late MockFoodLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockFoodRemoteDataSource();
    mockLocalDataSource = MockFoodLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = DataFoodRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getFood', () {
    const String testQuery = "Pizza";
    const FoodModel testFoodModel = FoodModel(
      name: "Pizza",
      servingSize: 100,
      calories: 219,
      sugar: 21,
      fiber: 11,
      totalCarbs: 32,
      saturatedFat: 12,
      totalFat: 25,
      protein: 15,
      sodium: 220,
      potassium: 30,
      cholesterol: 10,
    );
    test('should check if there is internet connection', () {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getFood(testQuery))
          .thenAnswer((_) async => [testFoodModel]);
      // act
      repository.getFood(testQuery);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getFood(testQuery))
            .thenAnswer((_) async => [testFoodModel]);
        // act
        await repository.getFood(testQuery);
        // assert
        verify(mockRemoteDataSource.getFood(testQuery));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getFood(testQuery))
            .thenAnswer((_) async => [testFoodModel]);
        // act
        await repository.getFood(testQuery);
        // assert
        verify(mockRemoteDataSource.getFood(testQuery));
        verify(mockLocalDataSource.saveFoods([testFoodModel]));
      });

      test(
          'should return failure error when call to remote data source is not successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getFood(testQuery))
            .thenThrow(ServerException());
        // act
        final result = await repository.getFood(testQuery);
        // assert
        verify(mockRemoteDataSource.getFood(testQuery));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return server failure when there is no connection',
          () async {
        // act
        final result = await repository.getFood(testQuery);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('getSavedFoods', () {
    const List<FoodModel> testModelList = [
      FoodModel(
        name: "Pizza",
        servingSize: 100,
        calories: 219,
        sugar: 21,
        fiber: 11,
        totalCarbs: 32,
        saturatedFat: 12,
        totalFat: 25,
        protein: 15,
        sodium: 220,
        potassium: 30,
        cholesterol: 10,
      ),
      FoodModel(
        name: "Pizza",
        servingSize: 100,
        calories: 219,
        sugar: 21,
        fiber: 11,
        totalCarbs: 32,
        saturatedFat: 12,
        totalFat: 25,
        protein: 15,
        sodium: 220,
        potassium: 30,
        cholesterol: 10,
      ),
      FoodModel(
        name: "Pizza",
        servingSize: 100,
        calories: 219,
        sugar: 21,
        fiber: 11,
        totalCarbs: 32,
        saturatedFat: 12,
        totalFat: 25,
        protein: 15,
        sodium: 220,
        potassium: 30,
        cholesterol: 10,
      ),
    ];

    const List<FoodModel> testFoodList = testModelList;
    test(
        'should return local data if the call to local data source is successful',
        () async {
      // arrange
      when(mockLocalDataSource.getSavedFoods())
          .thenAnswer((_) async => testModelList);
      // act
      final result = await repository.getSavedFoods();
      // assert
      verify(mockLocalDataSource.getSavedFoods());
      expect(result, equals(const Right(testFoodList)));
    });
  });
}
