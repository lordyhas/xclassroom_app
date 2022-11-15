library app_bloc;
export 'switch_home_bloc/switch_home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(bloc.toString() + " => onEvent() : $event");
    super.onEvent(bloc, event);
  }

  /*@override
  void onChange(Cubit cubit, Change change) {
    print(cubit.toString() + " => onChange() : $change");
    super.onChange(cubit, change);
  }*/

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(bloc.toString() + " => onTransition()  : $transition");
    super.onTransition(bloc, transition);
  }

/* @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print("onError()  : $error");
    //print(error);
    super.onError(bloc, error, stackTrace);
  }*/

}
