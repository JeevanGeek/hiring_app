part of 'candidate_bloc.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();

  @override
  List<Object> get props => [];
}

class CandidateInitial extends CandidateState {
  const CandidateInitial();
}

class CandidateLoading extends CandidateState {
  const CandidateLoading();
}

class ProfileSaved extends CandidateState {
  const ProfileSaved();
}

class JobApplied extends CandidateState {
  const JobApplied(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CandidateError extends CandidateState {
  const CandidateError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}
