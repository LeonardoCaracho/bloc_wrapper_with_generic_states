import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(Initial()) {
    on<GeneralEvent>((event, emit) {});
  }
}
