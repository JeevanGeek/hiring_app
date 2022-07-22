part of 'candidate_bloc.dart';

abstract class CandidateEvent extends Equatable {
  const CandidateEvent();

  @override
  List<Object> get props => [];
}

class SaveCandidateProfile extends CandidateEvent {
  const SaveCandidateProfile();
}

class AddApplication extends CandidateEvent {
  const AddApplication(this.job);

  final QueryDocumentSnapshot<Map<String, dynamic>> job;

  @override
  List<Object> get props => [job];
}
