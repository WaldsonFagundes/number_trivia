import 'package:dartz/dartz.dart';
import 'package:trivia/features/number_trivia/domain/entities/e_entities.dart';

import '../repositories/e_repositories.dart';
import '../../../../core/e_core.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
