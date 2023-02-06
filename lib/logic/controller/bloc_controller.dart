library app_bloc;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'navigation_controller_bloc/navigation_controller_cubit.dart';



class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print(bloc.toString() + " => onEvent() : $event");
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(bloc.toString() + " => onChange() : $change");
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(bloc.toString() + " => onTransition()  : $transition");
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print("onError()  : $error");
    }
    //print(error);
    super.onError(bloc, error, stackTrace);
  }

}
