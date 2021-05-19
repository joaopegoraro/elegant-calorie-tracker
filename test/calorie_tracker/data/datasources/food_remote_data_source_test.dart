import 'dart:convert';

import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/core/utils/api.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/data/datasources/food_remote_data_source.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/data/food_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'food_remote_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late CalorieNinjasFoodRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CalorieNinjasFoodRemoteDataSource(client: mockHttpClient);
  });

  group('getFood', () {
    const String tQuery = 'Pizza';
    final tFoodModelList = FoodModel.fromJson(
        json.decode(fixture('food.json')) as Map<String, dynamic>);

    void setUpTestReturn200() =>
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(fixture('food.json'), 200));

    void setUpTestReturn400() =>
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('something went wrong', 404));
    test(
        'should perform a GET request on a URL with query being the endpoint and with API key header',
        () async {
      // arrange
      setUpTestReturn200();
      // act
      dataSource.getFood(tQuery);
      // assert
      verify(mockHttpClient.get(
          Uri.parse('https://api.calorieninjas.com/v1/nutrition?query=$tQuery'),
          headers: {
            'X-Api-Key': apiKey,
          }));
    });
    test(
      'should return FoodModel list when the response code is 200 (success)',
      () async {
        // arrange
        setUpTestReturn200();
        // act
        final result = await dataSource.getFood(tQuery);
        // assert
        expect(result, equals(tFoodModelList));
      },
    );

    test(
      'should return server exception when the response code is not 200',
      () async {
        // arrange
        setUpTestReturn400();
        // act
        final call = dataSource.getFood;
        // assert
        expect(call(tQuery), throwsA(isA<ServerException>()));
      },
    );
  });
}
