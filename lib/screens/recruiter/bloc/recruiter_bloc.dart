import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recruiter_event.dart';
part 'recruiter_state.dart';

class RecruiterBloc extends Bloc<RecruiterEvent, RecruiterState> {
  RecruiterBloc() : super(const RecruiterInitial()) {
    on<RecruiterEvent>((event, emit) {});
  }
}
