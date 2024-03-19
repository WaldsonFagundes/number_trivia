// Mocks generated by Mockito 5.4.4 from annotations
// in trivia/test/feature/number_trivia/data/repositories/number_trivia_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trivia/core/platform/network_info.dart' as _i4;
import 'package:trivia/features/number_trivia/data/e_data.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNumberTriviaModel_0 extends _i1.SmartFake
    implements _i2.NumberTriviaModel {
  _FakeNumberTriviaModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NumberTriviaRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaRemoteDataSource extends _i1.Mock
    implements _i2.NumberTriviaRemoteDataSource {
  @override
  _i3.Future<_i2.NumberTriviaModel> getConcreteNumberTrivia(int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConcreteNumberTrivia,
          [number],
        ),
        returnValue:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getConcreteNumberTrivia,
            [number],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getConcreteNumberTrivia,
            [number],
          ),
        )),
      ) as _i3.Future<_i2.NumberTriviaModel>);

  @override
  _i3.Future<_i2.NumberTriviaModel> getRandomNumberTrivia() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomNumberTrivia,
          [],
        ),
        returnValue:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getRandomNumberTrivia,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getRandomNumberTrivia,
            [],
          ),
        )),
      ) as _i3.Future<_i2.NumberTriviaModel>);
}

/// A class which mocks [NumberTriviaLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaLocalDataSource extends _i1.Mock
    implements _i2.NumberTriviaLocalDataSource {
  @override
  _i3.Future<_i2.NumberTriviaModel> getLastNumberTrivia() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLastNumberTrivia,
          [],
        ),
        returnValue:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getLastNumberTrivia,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.NumberTriviaModel>.value(_FakeNumberTriviaModel_0(
          this,
          Invocation.method(
            #getLastNumberTrivia,
            [],
          ),
        )),
      ) as _i3.Future<_i2.NumberTriviaModel>);

  @override
  _i3.Future<void> cacheNumberTrivia(_i2.NumberTriviaModel? triviaToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNumberTrivia,
          [triviaToCache],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i4.NetworkInfo {
  @override
  _i3.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
