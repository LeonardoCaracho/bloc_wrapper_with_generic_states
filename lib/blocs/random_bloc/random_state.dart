part of 'random_bloc.dart';

class RandomState extends GeneralState {}

class RandomLoadSuccess extends RandomState {
  final int value;

  RandomLoadSuccess({required this.value});
}
