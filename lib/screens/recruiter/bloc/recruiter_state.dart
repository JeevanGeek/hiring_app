part of 'recruiter_bloc.dart';

abstract class RecruiterState extends Equatable {
  const RecruiterState();

  @override
  List<Object> get props => [];
}

class RecruiterInitial extends RecruiterState {
  const RecruiterInitial();
}

class RecruiterLoading extends RecruiterState {
  const RecruiterLoading();
}

class ProfileSaved extends RecruiterState {
  const ProfileSaved();
}

class RecruiterError extends RecruiterState {
  const RecruiterError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}

class JobAdded extends RecruiterState {
  const JobAdded(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ApplicantsLoaded extends RecruiterState {
  const ApplicantsLoaded(this.applicants);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> applicants;

  @override
  List<Object> get props => [applicants];
}
