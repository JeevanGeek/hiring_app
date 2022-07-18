import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/auth.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeInitial());

  void getStatus() {
    Future.delayed(Duration.zero, () {
      if (Auth().isLoggedIn) {
        emit(const LoggedIn());
      } else {
        emit(const LoggedOut());
      }
    });
  }
}
