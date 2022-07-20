import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';

part 'recruiter_event.dart';
part 'recruiter_state.dart';

class RecruiterBloc extends Bloc<RecruiterEvent, RecruiterState> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final profileKey = GlobalKey<FormState>();

  late String sector;
  late String companySize;
  late String city;

  RecruiterBloc() : super(const RecruiterInitial()) {
    on<SaveRecruiterProfile>((event, emit) async {
      emit(const Loading());
      try {
        await Db().setRecruiterProfile(
          nameController.text,
          phoneController.text,
          sector,
          companySize,
          city,
          websiteController.text,
        );
        await Db().getProfile();
        emit(const ProfileSaved());
      } catch (e) {
        emit(ShowError(e));
      }
    });
  }
}
