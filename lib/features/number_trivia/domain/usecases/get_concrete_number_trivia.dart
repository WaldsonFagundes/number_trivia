import 'package:dartz/dartz.dart';
import 'package:trivia/features/number_trivia/domain/entities/entities.dart';

import '../repositories/repositories.dart';
import '../../../../core/core.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
