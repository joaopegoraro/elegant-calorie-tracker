// Mocks generated by Mockito 5.0.7 from annotations
// in elegant_calorie_tracker/test/features/calorie_tracker/domain/usecases/get_food_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:elegant_calorie_tracker/core/error/failures.dart' as _i5;
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart'
    as _i6;
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/repositories/food_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [FoodRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodRepository extends _i1.Mock implements _i3.FoodRepository {
  MockFoodRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Food>> getFood(String? query) =>
      (super.noSuchMethod(Invocation.method(#getFood, [query]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Food>>.value(
                  _FakeEither<_i5.Failure, _i6.Food>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Food>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Food>>> getSavedFoods() =>
      (super.noSuchMethod(Invocation.method(#getSavedFoods, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Food>>>.value(
              _FakeEither<_i5.Failure, List<_i6.Food>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Food>>>);
}
