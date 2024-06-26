import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia/core/e_core.dart';

import '../e_data.dart';

abstract class NumberTriviaLocalDataSource {
  ///Gets the cache [NumberTriviaModel] wich was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cache data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const cachedNumberTrivia = "CACHED_NUMBER_TRIVIA";

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(cachedNumberTrivia);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    sharedPreferences.setString(cachedNumberTrivia, json.encode(triviaToCache.toJson()));
  }
}
