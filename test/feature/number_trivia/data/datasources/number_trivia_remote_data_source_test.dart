import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/core/e_core.dart';
import 'package:trivia/features/number_trivia/data/datasources/e_datasources.dart';
import 'package:trivia/features/number_trivia/data/e_data.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late NumberTriviaRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = NumbeTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });
void setUpMockHttpClientSuccess200(){
  when(mockHttpClient.get(any, headers: anyNamed('headers')))
      .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
}
  void setUpMockHttpClientFailure404(){
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }
  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test('''Should perform a Get request on a URL with number
 being the endpoint and with application/json header''', () async {

      setUpMockHttpClientSuccess200();

     await dataSource.getConcreteNumberTrivia(tNumber);

      verify(mockHttpClient.get(Uri(path: "http://numbersapi.com/$tNumber"), headers: {
        'Content-Type': 'application/json',
      }));
    });
     test ("Should return NumberTrivia when the response code is 200", () async {
       setUpMockHttpClientSuccess200();

        final result = await dataSource.getConcreteNumberTrivia(tNumber);
        expect(result, equals(tNumberTriviaModel));

         });

    test ("Should throw a ServerException when the response code is 404 or other", () async {
          setUpMockHttpClientFailure404();

      final call =  dataSource.getConcreteNumberTrivia;
      expect(() => call(tNumber), throwsA(const TypeMatcher<ServerException>()));

    });
  });
}
