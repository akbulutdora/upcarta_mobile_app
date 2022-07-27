import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';


void main () {
  NetworkInfoImpl networkInfo= NetworkInfoImpl();

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
          () async {
        // arrange
        const tHasConnectionFuture = true;

        // act
        // NOTICE: We're NOT awaiting the result
        final result = await networkInfo.isConnected;
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(result, tHasConnectionFuture);
      },
    );
  });
}