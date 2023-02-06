import 'dart:async';


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:unhorizons/logic/controller/authentication_bloc/auth_repository/setup.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthController
    extends Bloc<AuthEvent, AuthState> {
  AuthController(
      {required AuthRepository authRepository})
      : _authenticationRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authRepository.currentUser)
              : const AuthState.unknown(),
        ) {
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AuthUserChanged(user)),
    );
  }

  final AuthRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;


  bool get isSignedIn => state.status == AuthenticatedStatus.done;
  bool get isNotSignedIn => !isSignedIn;

  void _onUserChanged(
      AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthState.authenticated(event.user)
          : const AuthState.unknown(),
    );
  }

  void updateUser(User user) {
    add(AuthUserChanged(user));
  }

  void _onLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  void logout(){
    add(AuthLogoutRequested());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
