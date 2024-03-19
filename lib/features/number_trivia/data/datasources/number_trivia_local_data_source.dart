import '../e_data.dart';

abstract class NumberTriviaLocalDataSource {
  ///Gets the cache [NumberTriviaModel] wich was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cache data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
