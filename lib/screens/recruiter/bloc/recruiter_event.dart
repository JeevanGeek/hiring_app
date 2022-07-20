part of 'recruiter_bloc.dart';

abstract class RecruiterEvent extends Equatable {
  const RecruiterEvent();

  @override
  List<Object> get props => [];
}

class SaveRecruiterProfile extends RecruiterEvent {
  const SaveRecruiterProfile();
}
