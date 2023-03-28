import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';

class BlocWrapper<TBloc extends Bloc<dynamic, dynamic>, TSuccessState> extends StatelessWidget {
  final Widget Function(BuildContext context)? loading;
  final Widget Function(BuildContext context)? initial;
  final Widget Function(BuildContext context)? failure;
  final Widget Function(BuildContext context, TSuccessState state)? success;

  const BlocWrapper({
    Key? key,
    this.loading,
    this.initial,
    this.success,
    this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TBloc, dynamic>(
      builder: (context, state) {
        if (state is Initial && initial != null) {
          return initial!(context);
        }

        if (state is LoadInProgress && loading != null) {
          return loading!(context);
        }

        if (state is LoadInProgress && failure != null) {
          return failure!(context);
        }

        if (state is TSuccessState && success != null) {
          return success!(context, state);
        }

        //this is a default state
        return const SizedBox.shrink();
      },
    );
  }
}
