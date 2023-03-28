import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../bloc.dart';

part '../random_bloc/random_event.dart';
part '../random_bloc/random_state.dart';

class RandomBloc extends Bloc<RandomEvent, GeneralState> {
  RandomBloc() : super(Initial()) {
    on<RandomGeneratePressed>((event, emit) async {
      emit(LoadInProgress());

      await Future.delayed(const Duration(seconds: 2), () {
        emit(RandomLoadSuccess(value: Random().nextInt(100)));
      });
    });
  }
}
