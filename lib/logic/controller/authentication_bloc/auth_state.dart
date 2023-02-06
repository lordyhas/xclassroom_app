
part of 'auth_controller_bloc.dart';

enum AuthenticatedStatus {done, unknown}

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthenticatedStatus.unknown,
    this.user = User.empty,
  });


  const AuthState.empty() : this._();

  const AuthState.authenticated(User user)
      : this._(status: AuthenticatedStatus.done, user: user);

  const AuthState.updated(User user)
      : this.authenticated(user);

  const AuthState.unknown()
      : this._(status: AuthenticatedStatus.unknown);

  final AuthenticatedStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
