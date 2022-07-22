part of 'recruiter_bloc.dart';

abstract class RecruiterEvent extends Equatable {
  const RecruiterEvent();

  @override
  List<Object> get props => [];
}

class SaveRecruiterProfile extends RecruiterEvent {
  const SaveRecruiterProfile();
}

class AddJob extends RecruiterEvent {
  const AddJob();
}

class GetApplicants extends RecruiterEvent {
  const GetApplicants(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
