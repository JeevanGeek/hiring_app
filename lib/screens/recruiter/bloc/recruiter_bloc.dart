import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';
import 'package:hiring_app/utils/strings.dart';

part 'recruiter_event.dart';
part 'recruiter_state.dart';

class RecruiterBloc extends Bloc<RecruiterEvent, RecruiterState> {
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final jobTitleController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  final recruiterKey = GlobalKey<FormState>();
  final jobKey = GlobalKey<FormState>();

  late String sector;
  late String employees;
  late String city;
  late String jobType;
  late String jobCulture;
  late String payRange;
  late String location;

  RecruiterBloc() : super(const RecruiterInitial()) {
    on<SaveRecruiterProfile>((event, emit) async {
      emit(const RecruiterLoading());
      try {
        await Db().setRecruiterProfile(
          companyController.text,
          phoneController.text,
          sector,
          employees,
          city,
          websiteController.text,
        );
        await Db().getProfile();
        emit(const ProfileSaved());
      } catch (e) {
        emit(RecruiterError(e));
      }
    });

    on<AddJob>((event, emit) async {
      emit(const RecruiterLoading());
      try {
        await Db().addJob(
          jobTitleController.text,
          jobType,
          jobCulture,
          payRange,
          location,
          jobDescriptionController.text,
        );
        emit(const JobAdded(AppStrings.jobAdded));
      } catch (e) {
        emit(RecruiterError(e));
      }
    });

    on<GetApplicants>((event, emit) async {
      emit(const RecruiterLoading());
      try {
        final applicants = await Db().getApplicants(event.id);
        emit(ApplicantsLoaded(applicants));
      } catch (e) {
        emit(RecruiterError(e));
      }
    });
  }
}
