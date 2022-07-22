part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsInitial extends JobsState {
  const JobsInitial();
}

class SearchLoading extends JobsState {
  const SearchLoading();
}

class SearchJobLoaded extends JobsState {
  const SearchJobLoaded(this.jobs);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> jobs;

  @override
  List<Object> get props => [jobs];
}

class SearchJobEmpty extends JobsState {
  const SearchJobEmpty();
}

class SearchShowError extends JobsState {
  const SearchShowError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}
