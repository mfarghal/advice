import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      // execute
      await Future.delayed(const Duration(seconds: 3));
      emit(AdviceStateLoaded(advice: 'fake advice'));
    });
  }
}
