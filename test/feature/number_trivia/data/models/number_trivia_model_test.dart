import 'package:flutter_test/flutter_test.dart';

import 'package:trivia/features/number_trivia/data/e_data.dart';
import 'package:trivia/features/number_trivia/domain/e_domain.dart';

void main(){
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Test');

  test('Should be a subclass of NumberTrivia entity', () async {

    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

}