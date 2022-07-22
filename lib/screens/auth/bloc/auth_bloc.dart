import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/services/auth.dart';
import 'package:hiring_app/services/db.dart';
import 'package:hiring_app/utils/strings.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  final forgotKey = GlobalKey<FormState>();

  late String role;

  AuthBloc() : super(const AuthInitial()) {
    on<UserRegister>((event, emit) async {
      emit(const AuthLoading());
      try {
        await Auth().register(
          emailController.text,
          passwordController.text,
        );
        await Db().addUser(
          role,
          emailController.text,
        );
        await Db().getProfile();
        emit(const LoggedIn());
      } catch (e) {
        emit(AuthError(e));
      }
    });

    on<UserLogin>((event, emit) async {
      emit(const AuthLoading());
      try {
        await Auth().login(
          emailController.text,
          passwordController.text,
        );
        await Db().getProfile();
        emit(const LoggedIn());
      } catch (e) {
        emit(AuthError(e));
      }
    });

    on<UserLogout>((event, emit) async {
      emit(const AuthLoading());
      try {
        await Auth().logout();
        await clear();
        emit(const LoggedOut());
      } catch (e) {
        emit(AuthError(e));
      }
    });

    on<UserForgot>((event, emit) async {
      emit(const AuthLoading());
      try {
        await Auth().forgot(emailController.text);
        emit(
          const EmailSent(AppStrings.passwordSent),
        );
      } catch (e) {
        emit(AuthError(e));
      }
    });

    on<UserDelete>((event, emit) async {
      emit(const AuthLoading());
      try {
        await Auth().delete();
        await clear();
        emit(const UserDeleted());
      } catch (e) {
        emit(AuthError(e));
      }
    });
  }

  Future<void> clear() async {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
