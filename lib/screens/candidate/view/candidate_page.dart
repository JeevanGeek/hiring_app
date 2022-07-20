import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';

class CandidatePage extends StatelessWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateBloc(),
      child: const CandidateView(),
    );
  }
}

class CandidateView extends StatelessWidget {
  const CandidateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate'),
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
