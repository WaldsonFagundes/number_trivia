import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:trivia/features/number_trivia/data/e_data.dart';
import 'package:trivia/features/number_trivia/domain/e_domain.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('Should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('Should return a valid model when the JSON number is an integer',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });

    test('Should return a valid model when the JSON number is a double',
            () async {
          final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);

          expect(result, tNumberTriviaModel);
        });
  });
}
