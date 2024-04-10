
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/e_core.dart';
import '../../domain/e_domain.dart';
import 'e_bloc.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
   {
    required GetConcreteNumberTrivia concrete,
    required GetRandomNumberTrivia random,
    required this.inputConverter,
  })  : getRandomNumberTrivia = random,
        getConcreteNumberTrivia = concrete, super(Empty());


  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {}
}
