import 'package:equatable/equatable.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object?> get props => [];
}

class InitialNumberTriviaState extends NumberTriviaState {}
