// Mocks generated by Mockito 5.0.7 from annotations
// in elegant_calorie_tracker/test/features/calorie_tracker/data/repositories/data_food_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_local_data_source.dart'
    as _i4;
import 'package:elegant_calorie_tracker/calorie_tracker/data/datasources/food_remote_data_source.dart'
    as _i6;
import 'package:elegant_calorie_tracker/calorie_tracker/data/models/food_model.dart'
    as _i5;
import 'package:elegant_calorie_tracker/core/network/network_info.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i2.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}

/// A class which mocks [FoodLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodLocalDataSource extends _i1.Mock
    implements _i4.FoodLocalDataSource {
  MockFoodLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i5.FoodModel>> getSavedFoods() =>
      (super.noSuchMethod(Invocation.method(#getSavedFoods, []),
              returnValue: Future<List<_i5.FoodModel>>.value(<_i5.FoodModel>[]))
          as _i3.Future<List<_i5.FoodModel>>);
  @override
  _i3.Future<void> saveFoods(List<_i5.FoodModel>? foodToCache) =>
      (super.noSuchMethod(Invocation.method(#saveFoods, [foodToCache]),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}

/// A class which mocks [FoodRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodRemoteDataSource extends _i1.Mock
    implements _i6.FoodRemoteDataSource {
  MockFoodRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i5.FoodModel>> getFood(String? query) =>
      (super.noSuchMethod(Invocation.method(#getFood, [query]),
              returnValue: Future<List<_i5.FoodModel>>.value(<_i5.FoodModel>[]))
          as _i3.Future<List<_i5.FoodModel>>);
}