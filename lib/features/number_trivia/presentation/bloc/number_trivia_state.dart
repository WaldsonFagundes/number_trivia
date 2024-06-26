import 'package:equatable/equatable.dart';
import 'package:trivia/features/number_trivia/domain/e_domain.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object?> get props => [];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  const Loaded({required this.trivia});

  @override
  List<Object?> get props => [trivia];
}
class Error extends NumberTriviaState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
