import 'package:dartz/dartz.dart';

import '../e_core.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final strInt = int.parse(str);
      if (strInt < 0) throw const FormatException();
      return Right(strInt);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
