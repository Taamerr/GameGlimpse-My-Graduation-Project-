import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../view_model/match_details_cubit/match_details_cubit.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MatchDetailsCubit, MatchDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MatchDetailsCubit.get(context);
        return state is MatchDetailsGetMatchStatsLoadingState
            ? Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: TAppColors.kBlue,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      cubit.teamAStat[3].type!.name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: cubit.teamAStat[3].data!.value!,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: TAppColors.kBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${cubit.teamAStat[3].data!.value!}%',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: cubit.teamBStat[3].data!.value!,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: TAppColors.kGrey1,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${cubit.teamBStat[3].data!.value!}%',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[2].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[2].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[2].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat.last.data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat.last.type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat.last.data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[7].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[7].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[7].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${cubit.teamAStat[13].data!.value!}',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  '(${cubit.teamAStat[14].data!.value!}%)',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Accurate passes',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${cubit.teamBStat[13].data!.value!}',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  '(${cubit.teamBStat[14].data!.value!}%)',
                                  style: const TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[8].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[8].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[8].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[9].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[9].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[9].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[7].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[7].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[7].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[0].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[0].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[0].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[16].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[16].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[16].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[15].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[15].type!.name!,
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[15].data!.value!}',
                              style: const TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}
