import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';

abstract class FoodRemoteDataSource {
  /// Calls the https://api.calorieninjas.com/v1/nutrition?query='{query}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FoodModel> getFood(String query);
}
