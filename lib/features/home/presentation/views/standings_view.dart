import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../view_model/home_cubit/home_cubit.dart';
import 'widgets/standing/custom_standing_item.dart';
import 'widgets/standing/custom_standing_league_header.dart';
import 'widgets/standing/standing_header_first_row.dart';

class StandingsView extends StatelessWidget {
  const StandingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 18,
      ),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
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
                        const SizedBox(
                          height: 18.0,
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
