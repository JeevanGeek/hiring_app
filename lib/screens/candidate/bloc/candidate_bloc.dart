import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final candidateKey = GlobalKey<FormState>();

  late String iAm;
  late String gender;
  late String city;

  CandidateBloc() : super(const CandidateInitial()) {
    on<SaveCandidateProfile>((event, emit) async {
      emit(const Loading());
      try {
        await Db().setCandidateProfile(
          nameController.text,
          phoneController.text,
          iAm,
          gender,
          city,
          dobController.text,
        );
        await Db().getProfile();
        emit(const ProfileSaved());
      } catch (e) {
        emit(ShowError(e));
      }
    });
  }
}
