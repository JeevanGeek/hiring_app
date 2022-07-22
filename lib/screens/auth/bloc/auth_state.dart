part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class LoggedIn extends AuthState {
  const LoggedIn();
}

class LoggedOut extends AuthState {
  const LoggedOut();
}

class AuthError extends AuthState {
  const AuthError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}

class EmailSent extends AuthState {
  const EmailSent(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class UserDeleted extends AuthState {
  const UserDeleted();
}
