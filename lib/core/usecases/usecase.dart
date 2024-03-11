import 'package:dartz/dartz.dart';

import '/core/e_core.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
