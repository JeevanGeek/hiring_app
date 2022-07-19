import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  CandidateBloc() : super(const CandidateInitial()) {
    on<CandidateEvent>((event, emit) {});
  }
}
