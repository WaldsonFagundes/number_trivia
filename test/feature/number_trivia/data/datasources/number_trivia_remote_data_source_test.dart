import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/features/number_trivia/data/datasources/e_datasources.dart';

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

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;

    test('''Should perform a Get request on a URL with number
 being the endpoint and with application/json header''', () async {

      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));

     await dataSource.getConcreteNumberTrivia(tNumber);

      verify(mockHttpClient.get(Uri(path: "http://numbersapi.com/$tNumber"), headers: {
        'Content-Type': 'application/json',
      }));
    });
  });
}