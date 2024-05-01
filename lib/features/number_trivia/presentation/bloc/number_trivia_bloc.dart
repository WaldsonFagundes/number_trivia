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
      if (event is GetTriviaForConcreteNumber) {
        emit(Empty());
        final inputEither =
            inputConverter.stringToUnsignedInteger(event.numberString);

        inputEither.fold(
          (failure) async =>
              emit(const Error(message: INVALID_INPUT_FAILURE_MESSAGE)),
          (integer) async {
            emit(Loading());
            final failureOrTrivia =
                await getConcreteNumberTrivia(Params(number: integer));
            failureOrTrivia.fold((failure) => emit(Error(message: _mapFailureToMessage(failure))),
                (trivia) => emit(Loaded(trivia: trivia)));
          },
        );
      } else if(event is GetTriviaForRandomNumber) {
        emit(Empty());
        emit(Loading());
        final failureOrTrivia =
        await getRandomNumberTrivia(NoParams());
        failureOrTrivia.fold((failure) => emit(Error(message: _mapFailureToMessage(failure))),
                (trivia) => emit(Loaded(trivia: trivia)));
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
