import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/loading/loading.dart';
import 'package:hiring_app/utils/size_config.dart';
import 'package:hiring_app/widgets/widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingCubit()..getStatus(),
      child: const LoadingView(),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          if (state is LoggedIn) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          } else if (state is NotLoggedIn) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.onboarding,
              (route) => false,
            );
          }
        },
        child: const Loader(),
      ),
    );
  }
}
