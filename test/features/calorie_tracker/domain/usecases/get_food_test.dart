import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/repositories/food_repository.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/usecases/get_food.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_food_test.mocks.dart';

@GenerateMocks([FoodRepository])
void main() {
  late MockFoodRepository mockFoodRepository;
  late GetFood usecase;

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    usecase = GetFood(mockFoodRepository);
  });

  const String testQuery = "Pizza";
  const Food testFood = Food(
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

  test(
    'should get food for the query from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getFood is called with any argument, always answer with
      // the Right "side" of Either containing a test Food object.
      when(mockFoodRepository.getFood(any))
          .thenAnswer((_) async => const Right([testFood]));
      // The "act" phase of the test. Call the method.
      final result = await usecase(const Params(query: testQuery));
      // UseCase should simply return whatever was returned from the Repository
      expect(result, const Right([testFood]));
      // Verify that the method has been called on the Repository
      verify(mockFoodRepository.getFood(testQuery));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockFoodRepository);
    },
  );
}
