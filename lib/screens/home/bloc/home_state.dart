part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeError extends HomeState {
  const HomeError(this.message);

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
  const JobLoaded(this.jobs, this.applications);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> jobs;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> applications;

  @override
  List<Object> get props => [jobs, applications];
}
