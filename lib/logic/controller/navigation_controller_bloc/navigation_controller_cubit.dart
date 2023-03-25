import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unhorizons/logic/controller/bloc_controller.dart';



enum NavigationScreen {
  home,
  course,
  planning,
}

class NavigationStateScreen {
  final NavigationScreen screen;
  final bool isProfileOpen;
  final bool isHomeOpen;
  const NavigationStateScreen._({
    this.screen = NavigationScreen.course,
    this.isProfileOpen = false,
    this.isHomeOpen = false,
  });
  const NavigationStateScreen.initial() : this._();
  const NavigationStateScreen.screen(NavigationScreen screen)
      : this._(screen: screen);
  const NavigationStateScreen.setOpen({bool? isProfileOpen, bool? isHomeOpen})
      : this._(
    isProfileOpen: isProfileOpen ?? false,
    isHomeOpen: isHomeOpen ?? false,
  );

  NavigationStateScreen copyWith({
    NavigationScreen? screen,
    bool? isProfileOpen,
  }) {
    return NavigationStateScreen._(
      screen: screen ?? this.screen,
      isProfileOpen: isProfileOpen ?? this.isProfileOpen,
    );
  }

}


class NavigationController extends Cubit<NavigationStateScreen> {
  NavigationController() : super(const NavigationStateScreen.initial());

  void setProfileOpen([bool isOpen = true]) => emit(state
      .copyWith(isProfileOpen: isOpen));

  void change(NavigationScreen screenState) => pushScreen(screenState);

  final _stackState = _Stack<NavigationScreen>();
  void pushScreen(NavigationScreen screenState) {
    if(screenState == currentScreen) return;
    _stackState.push(screenState);
    emit(NavigationStateScreen.screen(_stackState.peek));
    //return Future.value(null);
  }
  Future<bool> popScreen(){
    if(_stackState.isEmpty) return Future.value(true);
    _stackState.pop();
    emit(NavigationStateScreen.screen(_stackState.peek));
    return  Future.value(false);
  }

  NavigationScreen get currentScreen => state.screen;
  bool get isProfileOpen => state.isProfileOpen;
  bool get isProfileNotOpen => !state.isProfileOpen;
}


class _Stack<E extends NavigationScreen> {
  final _queue = Queue<E>();

  void push(E value) => _queue.addFirst(value);
  E pop() => _queue.removeFirst();

  E get peek => _queue.first;

  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;

  @override
  String toString()  => _queue.toString();
}
