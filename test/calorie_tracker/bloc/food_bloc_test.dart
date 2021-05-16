import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/bloc/calorie_tracker_bloc.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_repository.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_bloc_test.mocks.dart';

@GenerateMocks([FoodRepository])
void main() {
  late CalorieTrackerBloc bloc;
  late MockFoodRepository mockRepository;

  setUp(() {
    mockRepository = MockFoodRepository();
    bloc = CalorieTrackerBloc(repository: mockRepository);
  });

  test('initial state should be NoSavedFoods', () {
    expect(bloc.state, equals(NoSavedFood()));
  });

  group('GetFood', () {
    const String tQuery = "100g of Pizza";
    const FoodModel tFoodModel = FoodModel(
      name: "Pizza",
      servingSize: 100,
      calories: 262.9,
      sugar: 3.6,
      fiber: 2.3,
      totalCarbs: 32.9,
      saturatedFat: 4.5,
      totalFat: 9.8,
      protein: 11.4,
      sodium: 587,
      potassium: 217,
      cholesterol: 16,
    );
    const List<FoodModel> tSavedFoods = [tFoodModel];

    void setUpSuccess() => when(mockRepository.getFood(any))
        .thenAnswer((_) async => const Right(tSavedFoods));

    test('should call the repository to get food', () async {
      // arrange
      setUpSuccess();
      // act
      bloc.add(const GetFood(tQuery));
      await untilCalled(mockRepository.getFood(any));
      // assert
      verify(mockRepository.getFood(tQuery));
    });

    test('should emit [SavingFood, Error] when no food is found', () async {
      // arrange
      when(mockRepository.getFood(any))
          .thenAnswer((_) async => Left(NotFoundFailure()));
      // assert
      final expected = [
        SavingFood(),
        const Error(errorMessage: notFoundFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetFood('I ate dirt yesterday'));
      await untilCalled(mockRepository.getFood(any));
      verify(mockRepository.getFood(any));
    });

    test(
        'should emit [SavingFood, Error] when no connection to server is possible',
        () async {
      // arrange
      when(mockRepository.getFood(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert
      final expected = [
        SavingFood(),
        const Error(errorMessage: serverFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetFood('100g of Pizza'));
      await untilCalled(mockRepository.getFood(any));
      verify(mockRepository.getFood(any));
    });

    test(
        'should emit [SavingFood, FoodSaved] when data is collected successfuly',
        () async {
      // arrange
      setUpSuccess();
      // assert
      final expected = [
        SavingFood(),
        const FoodSaved(savedFoods: tSavedFoods),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetFood(tQuery));
      await untilCalled(mockRepository.getFood(tQuery));
      verify(mockRepository.getFood(tQuery));
    });
  });

  group('GetSavedFood', () {
    const FoodModel tFoodModel = FoodModel(
      name: "Pizza",
      servingSize: 100,
      calories: 262.9,
      sugar: 3.6,
      fiber: 2.3,
      totalCarbs: 32.9,
      saturatedFat: 4.5,
      totalFat: 9.8,
      protein: 11.4,
      sodium: 587,
      potassium: 217,
      cholesterol: 16,
    );
    const List<FoodModel> tSavedFoods = [tFoodModel];

    void setUpSuccess() => when(mockRepository.getSavedFoods())
        .thenAnswer((_) async => const Right(tSavedFoods));

    test('should call the repository to get saved food', () async {
      // arrange
      setUpSuccess();
      // act
      bloc.add(GetSavedFood());
      await untilCalled(mockRepository.getSavedFoods());
      // assert
      verify(mockRepository.getSavedFoods());
    });

    test('should emit [SavingFood, Error] when there are no saved food',
        () async {
      // arrange
      when(mockRepository.getSavedFoods())
          .thenAnswer((_) async => Left(CacheFailure()));
      // assert
      final expected = [
        SavingFood(),
        const Error(errorMessage: cacheFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(GetSavedFood());
      await untilCalled(mockRepository.getSavedFoods());
      verify(mockRepository.getSavedFoods());
    });

    test(
        'should emit [SavingFood, FoodSaved] when data is collected successfuly',
        () async {
      // arrange
      setUpSuccess();
      // assert
      final expected = [
        SavingFood(),
        const FoodSaved(savedFoods: tSavedFoods),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(GetSavedFood());
      await untilCalled(mockRepository.getSavedFoods());
      verify(mockRepository.getSavedFoods());
    });
  });
}
