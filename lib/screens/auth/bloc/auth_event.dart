part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserRegister extends AuthEvent {
  const UserRegister();
}

class UserLogin extends AuthEvent {
  const UserLogin();
}

class UserLogout extends AuthEvent {
  const UserLogout();
}

class UserForgot extends AuthEvent {
  const UserForgot();
}

class UserDelete extends AuthEvent {
  const UserDelete();
}
