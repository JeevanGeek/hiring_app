import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/db.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<GetJobs>((event, emit) async {
      emit(const Loading());
      try {
        final jobs = Db().isCandidate
            ? (await Db().getAllJobs())
            : (await Db().getJobs());
        if (jobs.isEmpty) {
          return emit(const JobEmpty());
        } else {
          emit(JobLoaded(jobs));
        }
      } catch (e) {
        emit(ShowError(e));
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
