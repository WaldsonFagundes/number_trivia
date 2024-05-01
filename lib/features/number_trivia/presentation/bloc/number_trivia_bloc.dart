import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/e_core.dart';
import '../../domain/e_domain.dart';
import 'e_bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required GetConcreteNumberTrivia concrete,
    required GetRandomNumberTrivia random,
    required this.inputConverter,
  })  : getRandomNumberTrivia = random,
        getConcreteNumberTrivia = concrete,
        super(Empty()) {
    on<NumberTriviaEvent>((event, emit) async {
      if(event is GetTriviaForConcreteNumber) {
        emit(Empty());
        final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

        inputEither.fold(
              (failure) async => emit(const Error(message: INVALID_INPUT_FAILURE_MESSAGE)),
              (integer)  async {
                getConcreteNumberTrivia(Params(number: integer));

          },
        );
      }

    });


  }
}

