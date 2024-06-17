import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';
import 'package:gp_app/features/fixtures/presentation/view_model/picked_date_cubit/picked_date_cubit.dart';
import 'package:gp_app/features/fixtures/presentation/views/widgets/livecore_league_widget_tree.dart';
import 'package:gp_app/features/fixtures/presentation/views/widgets/no_matches_today.dart';

class PickedDateFixturesViewBody extends StatelessWidget {
  const PickedDateFixturesViewBody({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickedDateCubit, PickedDateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PickedDateCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            IconBroken.Arrow___Left_2,
                            size: 32.r,
                            color: TAppColors.kGrey1,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: state is FixturesGetPickedDateMatchesLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: TAppColors.kBlue,
                        ),
                      )
                    : state is FixturesGetPickedDateMatchesFailureState
                        ? const NoMatchesToday()
                        : LiveScoreLeagueWidgetTree(
                            matches: cubit.finalResult,
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}
