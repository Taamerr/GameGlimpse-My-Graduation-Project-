import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/summary/data/repos/video_summary_repo/video_summ_repo_impl.dart';
import 'package:gp_app/features/summary/presentation/view_model/video_summary_cubit/video_summary_cubit.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../fixtures/data/repos/fixtures_repo/fixtures_repo_impl.dart';
import '../../../fixtures/presentation/view_model/fixtures_cubit/fixtures_cubit.dart';
import '../../../standings/data/repos/standings_repo_impl.dart';
import '../../../standings/presentation/view_model/cubit/standings_cubit.dart';
import '../view_model/home_cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FixturesCubit(
            ServiceLocator.getIt.get<FixturesRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => StandingsCubit(
            ServiceLocator.getIt.get<StandingsRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => VideoSummaryCubit(
            ServiceLocator.getIt.get<VideoSummaryRepoImpl>(),
          )..getAllMatchDocuments(),
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
