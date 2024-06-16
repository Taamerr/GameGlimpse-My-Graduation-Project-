import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/utils/service_locator.dart';
import 'package:gp_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:gp_app/features/home/data/repos/home_repo/home_repo_impl.dart';

import '../../../../core/utils/cache_helper.dart';
import '../view_model/home_cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        ServiceLocator.getIt.get<HomeRepoImpl>(),
      )
        ..getDate()
        ..getAllMatches()
        ..getAllStandings(),
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
