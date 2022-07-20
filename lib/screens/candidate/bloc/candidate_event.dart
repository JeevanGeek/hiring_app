part of 'candidate_bloc.dart';

abstract class CandidateEvent extends Equatable {
  const CandidateEvent();

  @override
  List<Object> get props => [];
}

class SaveCandidateProfile extends CandidateEvent {
  const SaveCandidateProfile();
}
