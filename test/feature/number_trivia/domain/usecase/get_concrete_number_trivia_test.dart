import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:trivia/features/number_trivia/domain/repositories/repositories.dart';
import 'package:trivia/features/number_trivia/domain/usecases/usecases.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
 late GetConcreteNumberTrivia usecase;
 late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  int anyNumber = faker.guid.random.integer(100000, min: 0);

  test('Should get trivia for the number from the repository', () async {

    when(mockNumberTriviaRepository.getConcreteNumberTrivia(anyNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await usecase.execute(number: tNumber);

    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);

  });
}
