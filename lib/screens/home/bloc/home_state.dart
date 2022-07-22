part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class Loading extends HomeState {
  const Loading();
}

class ShowError extends HomeState {
  const ShowError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}

class TabChanged extends HomeState {
  const TabChanged(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class JobLoaded extends HomeState {
  const JobLoaded(this.jobs);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> jobs;

  @override
  List<Object> get props => [jobs];
}

class JobEmpty extends HomeState {
  const JobEmpty();
}
