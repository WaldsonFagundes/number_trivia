import 'package:dartz/dartz.dart';

import '../../../../core/e_core.dart';
import '../../../number_trivia/domain/entities/e_entities.dart';
import '../repositories/e_repositories.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}


