
import 'package:dartz/dartz.dart';

import '../e_core.dart';

class InputConverter{
  Either<Failure, int> stringToUnsignedInteger(String str){
    //TODO
    return Right(int.parse(str));
  }
}


class InvalidInputFailure extends Failure {}