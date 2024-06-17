import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  height: (MediaQuery.of(context).size.height * 0.45).h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: TAppColors.kBlue,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Text(
                      cubit.teamAStat[3].type!.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: cubit.teamAStat[3].data!.value!,
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: TAppColors.kBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(50.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.0.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${cubit.teamAStat[3].data!.value!}%',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: cubit.teamBStat[3].data!.value!,
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: TAppColors.kGrey1,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.r),
                                topRight: Radius.circular(50.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.0.w),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${cubit.teamBStat[3].data!.value!}%',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0.sp,
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
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[2].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[2].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[2].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat.last.data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat.last.type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat.last.data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[7].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[7].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[7].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${cubit.teamAStat[13].data!.value!}',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0.sp,
                                  ),
                                ),
                                Text(
                                  '(${cubit.teamAStat[14].data!.value!}%)',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0.sp,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Accuracy',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0.sp,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${cubit.teamBStat[13].data!.value!}',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0.sp,
                                  ),
                                ),
                                Text(
                                  '(${cubit.teamBStat[14].data!.value!}%)',
                                  style: TextStyle(
                                    color: TAppColors.kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[8].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[8].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[8].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[9].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[9].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[9].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[7].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[7].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[7].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[0].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[0].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[0].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[16].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[16].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[16].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cubit.teamAStat[15].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              cubit.teamAStat[15].type!.name!,
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              '${cubit.teamBStat[15].data!.value!}',
                              style: TextStyle(
                                color: TAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.sp,
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
