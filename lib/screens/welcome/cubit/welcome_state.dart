part of 'welcome_cubit.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class WelcomeInitial extends WelcomeState {
  const WelcomeInitial();
}

class LoggedIn extends WelcomeState {
  const LoggedIn();
}

class LoggedOut extends WelcomeState {
  const LoggedOut();
}
