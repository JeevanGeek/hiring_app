import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/screens/jobs/jobs.dart';
import 'package:hiring_app/services/db.dart';
import 'package:hiring_app/utils/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context)..add(const GetJobs()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const [
          JobsView(),
          ApplicationView(),
          SearchView(),
          ProfileView(),
        ][context.select<HomeCubit, int>((value) => value.selectedIndex)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Db().isRecruiter
          ? FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.newJob,
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const CircularNotchedRectangle(),
            child: NavigationBar(
              selectedIndex: context
                  .select<HomeCubit, int>((value) => value.selectedIndex),
              onDestinationSelected: (int newIndex) {
                context.read<HomeCubit>().changeIndex(newIndex);
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: AppStrings.jobs,
                ),
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: AppStrings.applications,
                ),
                NavigationDestination(
                  icon: Icon(Icons.search_outlined),
                  selectedIcon: Icon(Icons.search),
                  label: AppStrings.jobs,
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: AppStrings.profile,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
