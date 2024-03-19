import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final List _properties;

  const Failure([this._properties = const <dynamic>[]]);

  @override
  List<Object?> get props => [_properties];
}

//General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
