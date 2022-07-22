import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<GetJobs>((event, emit) async {
      emit(const HomeLoading());
      try {
        final jobs = Db().isCandidate
            ? (await Db().getCandidateJobs())
            : (await Db().getRecruiterJobs());
        final applications = Db().isCandidate
            ? (await Db().getCandidateApplications())
            : (await Db().getRecruiterApplications());
        emit(JobLoaded(jobs, applications));
      } catch (e) {
        emit(HomeError(e));
      }
    });
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  int selectedIndex = 0;

  changeIndex(index) {
    selectedIndex = index;
    emit(TabChanged(selectedIndex));
  }
}
