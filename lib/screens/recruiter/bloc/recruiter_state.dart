part of 'recruiter_bloc.dart';

abstract class RecruiterState extends Equatable {
  const RecruiterState();

  @override
  List<Object> get props => [];
}

class RecruiterInitial extends RecruiterState {
  const RecruiterInitial();
}

class Loading extends RecruiterState {
  const Loading();
}

class ProfileSaved extends RecruiterState {
  const ProfileSaved();
}

class ShowError extends RecruiterState {
  const ShowError(this.message);

  final Object message;

  @override
  List<Object> get props => [message];
}
