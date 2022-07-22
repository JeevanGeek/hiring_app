part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class SearchJobs extends JobsEvent {
  const SearchJobs(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
