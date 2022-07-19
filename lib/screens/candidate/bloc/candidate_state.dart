part of 'candidate_bloc.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();

  @override
  List<Object> get props => [];
}

class CandidateInitial extends CandidateState {
  const CandidateInitial();
}
