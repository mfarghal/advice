import 'package:advice/core/entities/exceptions.dart';
import 'package:advice/core/entities/failure.dart';
import 'package:advice/features/advice/data/datasources/advice_remote_datasource.dart';
import 'package:advice/features/advice/data/models/advice_model.dart';
import 'package:advice/features/advice/data/repository/advice_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'advice_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSourceImpl>()])
void main() {
  group('advice repository impl ', () {
    group('should return AdviceEntity ', () {
      test('when AdviceRemoteDataSource return AdviceModel', () async {
        // arrange
        final model = AdviceModel(0, 'advice');
        final mock = MockAdviceRemoteDataSourceImpl();
        final adviceRepository = AdviceRepositoryImpl(mock);
        when(mock.getRandomAdviceFromApi())
            .thenAnswer((realInvocation) => Future.value(model));
        // act
        final result = await adviceRepository.getAdviceFromDataSource();

        // assert
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right(model));

        verify(mock.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mock);
      });
    });
    group('should return Failure ', () {
      test('service failure when server exception occure', () async {
        // arrange

        final mock = MockAdviceRemoteDataSourceImpl();
        final adviceRepository = AdviceRepositoryImpl(mock);
        when(mock.getRandomAdviceFromApi())
            .thenAnswer((realInvocation) => throw ServerException());
        // act
        final result = await adviceRepository.getAdviceFromDataSource();

        // assert
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left(ServerFailure()));

        verify(mock.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mock);
      });
      test('general failure on all other exception', () async {
        // arrange

        final mock = MockAdviceRemoteDataSourceImpl();
        final adviceRepository = AdviceRepositoryImpl(mock);
        when(mock.getRandomAdviceFromApi())
            .thenAnswer((realInvocation) => throw Exception());
        // act
        final result = await adviceRepository.getAdviceFromDataSource();

        // assert
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left(GeneralFailure()));

        verify(mock.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mock);
      });
    });
  });
}
