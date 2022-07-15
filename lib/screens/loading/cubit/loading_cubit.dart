import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/utils/storage.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(const LoadingInitial());

  void getStatus() {
    Future.delayed(Duration.zero, () {
      if (Storage.isLoggedIn()) {
        emit(const LoggedIn());
      } else {
        emit(const NotLoggedIn());
      }
    });
  }
}
