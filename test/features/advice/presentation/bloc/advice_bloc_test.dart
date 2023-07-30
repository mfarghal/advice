import 'package:advice/core/entities/failure.dart';
import 'package:advice/features/advice/domain/entities/advice_entity.dart';
import 'package:advice/features/advice/domain/usecases/advice_usecases.dart';
import 'package:advice/features/advice/presentation/bloc/advice_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'advice_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceUseCases>()])
void main() {
  group('AdviceBloc', () {
    group('should emit', () {
      final mock = MockAdviceUseCases();
      blocTest<AdviceBloc, AdviceState>(
        'nothing when no event is added',
        build: () {
          final mock = MockAdviceUseCases();
          return AdviceBloc(mock);
        },
        expect: () => <AdviceState>[],
      );

      blocTest<AdviceBloc, AdviceState>(
        '[AdviceStateLoading] [AdviceStateError] when advice reqest event is added',
        setUp: () => when(mock.getAdvice()).thenAnswer((realInvocation) =>
            Future.value(const Right(AdviceEntity(0, 'fake advice')))),
        build: () => AdviceBloc(mock),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () => <AdviceState>[
          AdviceStateLoading(),
          AdviceStateLoaded(advice: 'fake advice')
        ],
      );

      blocTest<AdviceBloc, AdviceState>(
        '[AdviceStateLoading] [AdviceStateError] when advice reqest event is added',
        setUp: () => when(mock.getAdvice()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure()))),
        build: () => AdviceBloc(mock),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () => <AdviceState>[
          AdviceStateLoading(),
          AdviceStateError(message: 'API error , please try again!.')
        ],
      );
    });
  });
}
