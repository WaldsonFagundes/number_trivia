import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:trivia/core/e_core.dart';
import 'package:trivia/features/number_trivia/domain/e_domain.dart';
import 'package:trivia/features/number_trivia/presentation/bloc/e_bloc.dart';

import 'number_trivia_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetConcreteNumberTrivia>()])
@GenerateNiceMocks([MockSpec<GetRandomNumberTrivia>()])
@GenerateNiceMocks([MockSpec<InputConverter>()])
void main() {
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;
  late NumberTriviaBloc bloc;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('GetTriviaForConcreteNumber', () {
    const tNumberString = '1';
    const tNumberParsed = 1;
    const tNumberTrivia = NumberTrivia(number: 1, text: 'Test Trivia');

    void setUpMockInutConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(const Right(tNumberParsed));
    test(
        "Should call the InputConverter to validate and convert the string to an unsigned number",
        () async {
      setUpMockInutConverterSuccess();

      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));

      bloc.add(const GetTriviaForConcreteNumber(tNumberString));
       await untilCalled(mockInputConverter.stringToUnsignedInteger(any));

      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));

      verifyNoMoreInteractions(mockInputConverter);
    });


  });
}
