import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
      '[Bloc: ${bloc.runtimeType}] State changed: ${change.currentState} -> ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
      '[Bloc: ${bloc.runtimeType}] Transition: ${transition.currentState} -> ${transition.nextState} (Event: ${transition.event})',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(
      '[Bloc: ${bloc.runtimeType}] Error: $error\n$stackTrace',
    );
  }
}