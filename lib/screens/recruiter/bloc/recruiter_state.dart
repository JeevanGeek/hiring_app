part of 'recruiter_bloc.dart';

abstract class RecruiterState extends Equatable {
  const RecruiterState();

  @override
  List<Object> get props => [];
}

class RecruiterInitial extends RecruiterState {
  const RecruiterInitial();
}
