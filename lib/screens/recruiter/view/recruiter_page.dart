import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/recruiter/recruiter.dart';

class RecruiterPage extends StatelessWidget {
  const RecruiterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecruiterBloc(),
      child: const RecruiterView(),
    );
  }
}

class RecruiterView extends StatelessWidget {
  const RecruiterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruiter'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
