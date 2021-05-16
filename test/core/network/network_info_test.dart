import 'package:elegant_calorie_tracker/core/utils/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late InternetConnectionCheckerNetworkInfo networkInfoImplementation;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImplementation =
        InternetConnectionCheckerNetworkInfo(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should foward the call to InternetConnectionChecker.hasConnection',
        () async {
      // arrange
      final tHasConnection = Future.value(true);
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnection);
      // act
      final result = networkInfoImplementation.isConnected;
      // assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
