import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp_app/features/standings/presentation/view_model/cubit/standings_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../home/presentation/views/widgets/standing/custom_standing_item.dart';
import '../../../home/presentation/views/widgets/standing/custom_standing_league_header.dart';
import '../../../home/presentation/views/widgets/standing/standing_header_first_row.dart';

class StandingsView extends StatelessWidget {
  const StandingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 18.h,
      ),
      child: BlocConsumer<StandingsCubit, StandingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = StandingsCubit.get(context);
          int outerBuilder;
          return cubit.standings.length < 5
              ? const Center(
                  child: CircularProgressIndicator(
                    color: TAppColors.kBlue,
                  ),
                )
              : ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    outerBuilder = index;
                    return Column(
                      children: [
                        StandingLeagueHeader(
                          leagueStandingModel: cubit.standings[index],
                        ),
                         SizedBox(
                          height: 18.0.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff2B2B3D),
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                const StandingsHeaderFirstRow(),
                                const SizedBox(
                                  height: 6,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => StandingItem(
                                    teamData: cubit
                                        .standings[outerBuilder].data![index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                    color: TAppColors.kGrey2,
                                    thickness: 0.3,
                                  ),
                                  itemCount: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
