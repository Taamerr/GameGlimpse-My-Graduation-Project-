import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../fixtures/data/repos/fixtures_repo_impl.dart';
import '../../../fixtures/presentation/view_model/fixtures_cubit/fixtures_cubit.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import '../../data/repos/home_repo/home_repo_impl.dart';

import '../../../../core/utils/cache_helper.dart';
import '../view_model/home_cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            ServiceLocator.getIt.get<HomeRepoImpl>(),
          )..getAllStandings(),
        ),
        BlocProvider(
          create: (context) => FixturesCubit(
            ServiceLocator.getIt.get<FixturesRepoImpl>(),
          ),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: cubit.screens[cubit.currentIndex],
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: cubit.bottomItems,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavIndex(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
