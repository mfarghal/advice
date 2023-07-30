import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/failure.dart';
import '../../2_domain/usecases/advice_usecases.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final AdviceUseCases adviceUsecase = AdviceUseCases();
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      // execute
      final failureOrSuccess = await adviceUsecase.getAdvice();
      //
      failureOrSuccess.fold(
        (l) => emit(AdviceStateError(message: _mapFailureToMessage(l))),
        (r) => AdviceStateLoaded(advice: r.advice),
      );
    });
  }

  _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'API error , please try again!.';
      case CacheFailure:
        return 'Cache error , please try again!.';
      default:
        return 'Something gone wrong , please try again!.';
    }
  }
}
