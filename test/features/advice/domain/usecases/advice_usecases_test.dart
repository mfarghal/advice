import 'package:advice/core/entities/failure.dart';
import 'package:advice/features/advice/data/repository/advice_repository_impl.dart';
import 'package:advice/features/advice/domain/entities/advice_entity.dart';
import 'package:advice/features/advice/domain/usecases/advice_usecases.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepositoryImpl>()])
void main() {
  group('AdviceUseCases', () {
    group('should return Advance Entitiy', () {
      test('when AdviceRepositoryImpl return AdviceModel happen', () async {
        // arrange
        const entity = AdviceEntity(0, 'advice');
        final mock = MockAdviceRepositoryImpl();
        final usecase = AdviceUseCases(mock);

        when(mock.getAdviceFromDataSource())
            .thenAnswer((realInvocation) => Future.value(const Right(entity)));

        // act
        final result = await usecase.getAdvice();

        // assert
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right(entity));

        verify(mock.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mock);
      });
    });
    group('should return left with', () {
      test('server failure', () async {
        // arrange
        final mock = MockAdviceRepositoryImpl();
        final usecase = AdviceUseCases(mock);

        when(mock.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));

        // act
        final result = await usecase.getAdvice();

        // assert
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left(ServerFailure()));

        verify(mock.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mock);
      });
    });
  });
}
