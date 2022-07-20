part of 'candidate_bloc.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();

  @override
  List<Object> get props => [];
}

class CandidateInitial extends CandidateState {
  const CandidateInitial();
}

class Loading extends CandidateState {
  const Loading();
}

class ProfileSaved extends CandidateState {
  const ProfileSaved();
}

class ShowError extends CandidateState {
  const ShowError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}
