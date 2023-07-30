import 'package:advice/core/entities/exceptions.dart';
import 'package:advice/features/advice/data/datasources/advice_remote_datasource.dart';
import 'package:advice/features/advice/data/models/advice_model.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'advice_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceModel', () {
      test('when client response was 200 and has valid data', () async {
        // arrange
        final mock = MockClient();
        final adviceRemoteDatasource = AdviceRemoteDataSourceImpl(mock);
        when(
          mock.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: {'content-type': 'application/json'}),
        ).thenAnswer((realInvocation) => Future.value(
            Response('{"advice":"test advice","advice_id":1}', 200)));

        // act
        final result = await adviceRemoteDatasource.getRandomAdviceFromApi();

        // assert
        expect(result, AdviceModel(1, 'test advice'));
      });
    });

    group('should throw error', () {
      test('when client response was not 200', () async {
        // arrange
        final mock = MockClient();
        final adviceRemoteDatasource = AdviceRemoteDataSourceImpl(mock);
        when(
          mock.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: {'content-type': 'application/json'}),
        ).thenAnswer((realInvocation) => Future.value(Response('', 404)));

        // act

        // assert
        expect(adviceRemoteDatasource.getRandomAdviceFromApi(),
            throwsA(isA<ServerException>()));
      });

      test('type error when client response was not 200 and not valid data',
          () async {
        // arrange
        final mock = MockClient();
        final adviceRemoteDatasource = AdviceRemoteDataSourceImpl(mock);
        when(
          mock.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: {'content-type': 'application/json'}),
        ).thenAnswer((realInvocation) =>
            Future.value(Response('{"advice":"test advice","id":1}', 200)));

        // act

        // assert
        expect(adviceRemoteDatasource.getRandomAdviceFromApi(),
            throwsA(isA<TypeError>()));
      });
    });
  });
}
