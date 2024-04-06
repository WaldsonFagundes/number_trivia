import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/core/util/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        "Should return an integer when the string represents an unsigned integer",
        () async {
      const str = '123';

      final result = inputConverter.stringToUnsignedInteger(str);

      expect(result, const Right(123));
    });
    test(
        "Should return a failure when the string is not an integer",
            () async {
          const str = 'abc';

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result,  Left(InvalidInputFailure()));
        });

  });
}
