part of 'loading_cubit.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadingInitial extends LoadingState {
  const LoadingInitial();
}

class LoggedIn extends LoadingState {
  const LoggedIn();
}

class NotLoggedIn extends LoadingState {
  const NotLoggedIn();
}
