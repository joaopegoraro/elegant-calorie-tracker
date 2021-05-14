import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/usecases/get_saved_foods.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_food_test.mocks.dart';

void main() {
  late MockFoodRepository mockFoodRepository;
  late GetSavedFoods usecase;

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    usecase = GetSavedFoods(mockFoodRepository);
  });

  const List<Food> testList = <Food>[
    Food(
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
    Food(
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
    Food(
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

  test('should return food list from repository', () async {
    // arrange
    when(mockFoodRepository.getSavedFoods())
        .thenAnswer((_) async => const Right(testList));
    // act
    final result = await usecase.call(NoParams());
    // assert
    verify(mockFoodRepository.getSavedFoods());
    verifyNoMoreInteractions(mockFoodRepository);
    expect(result, const Right(testList));
  });
}
