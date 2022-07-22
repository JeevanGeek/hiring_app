import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  Timer? debounce;

  JobsBloc() : super(const JobsInitial()) {
    on<SearchJobs>((event, emit) async {
      emit(const SearchLoading());
      try {
        final jobs = await Db().searchJobs(event.query);
        if (jobs.isEmpty) {
          return emit(const SearchJobEmpty());
        } else {
          emit(SearchJobLoaded(jobs));
        }
      } catch (e) {
        emit(SearchShowError(e));
      }
    });
  }

  void searchNews(String query) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      add(SearchJobs(query));
    });
  }
}
