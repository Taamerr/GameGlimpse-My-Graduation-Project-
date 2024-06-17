import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view_model/fixtures_cubit/fixtures_cubit.dart';

import '../../../../core/constants/colors.dart';
import 'widgets/custom_matches_app_bar.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixturesCubit, FixturesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FixturesCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(
            left: 12.0.w,
            right: 12.0.w,
            top: 12.0.h,
          ),
          child: DefaultTabController(
            length: cubit.tabs.length,
            initialIndex: 6,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const CustomMatchesAppBar(),
                      TabBar(
                        physics: const BouncingScrollPhysics(),
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        labelStyle: TextStyle(
                          fontSize: 14.0.sp,
                        ),
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        labelColor: TAppColors.kWhite,
                        indicatorColor: TAppColors.kBlue,
                        unselectedLabelColor: TAppColors.kGrey2,
                        enableFeedback: true,
                        splashBorderRadius: BorderRadius.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: cubit.tabs,
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: state is FixturesGetMatchesLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: TAppColors.kBlue,
                          ),
                        )
                      : TabBarView(
                          children: cubit.tabsScreens,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
