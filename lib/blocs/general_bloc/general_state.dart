import 'package:equatable/equatable.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

class Initial extends GeneralState {}

class LoadInProgress extends GeneralState {}

class LoadFailure extends GeneralState {}

class LoadSuccess extends GeneralState {}
