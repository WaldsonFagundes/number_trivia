import 'package:dartz/dartz.dart';

import '../../../../core/e_core.dart';
import '../entities/e_entities.dart';

abstract class NumberTriviaRepository {

  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();

}