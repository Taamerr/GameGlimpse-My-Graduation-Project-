import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/fixtures_model/match_data.dart';

class CustomMatchCard extends StatelessWidget {
  const CustomMatchCard({
    super.key,
    required this.matchModel,
  });
  final MatchData matchModel;

  @override
  Widget build(BuildContext context) {
    num timestampInSeconds = matchModel.startingAtTimestamp!;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        (timestampInSeconds * 1000).toInt(),
        isUtc: true);

    String formattedTime = DateFormat('hh:mm a').format(dateTime.toLocal());

    List<String> parts = formattedTime.split(' '); // Split by space

    String time = parts[0];
    String amPm = parts[1];
    int goalHome = 0;
    int goalAway = 0;
    String homeName = '';
    String awayName = '';
    if (matchModel.participants!.first.meta!.location == 'home') {
      if (matchModel.participants!.first.name!.length > 20) {
        homeName = matchModel.participants!.first.shortCode!;
      } else {
        homeName = matchModel.participants!.first.name!;
      }
      if (matchModel.participants!.last.name!.length > 20) {
        awayName = matchModel.participants!.last.shortCode!;
      } else {
        awayName = matchModel.participants!.last.name!;
      }
    } else if (matchModel.participants!.first.meta!.location == 'away') {
      if (matchModel.participants!.first.name!.length > 20) {
        awayName = matchModel.participants!.first.shortCode!;
      } else {
        awayName = matchModel.participants!.first.name!;
      }
      if (matchModel.participants!.last.name!.length > 20) {
        homeName = matchModel.participants!.last.shortCode!;
      } else {
        homeName = matchModel.participants!.last.name!;
      }
    }
    for (var score in matchModel.scores!) {
      if (score.description == 'CURRENT' &&
          score.score!.participant == 'home') {
        goalHome = score.score!.goals!;
      } else if (score.description == 'CURRENT' &&
          score.score!.participant == 'away') {
        goalAway = score.score!.goals!;
      }
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kMatchDetails,
            extra: matchModel,
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: const Color(0xff2B2B3D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: Text(
                        homeName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: TAppColors.kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Row(
                      children: [
                        CachedNetworkImage(
                          height: 32.0.w,
                          width: 32.0.w,
                          imageUrl:
                              matchModel.participants!.first.meta!.location ==
                                      'home'
                                  ? matchModel.participants!.first.imagePath!
                                  : matchModel.participants!.last.imagePath!,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15.0.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                color: TAppColors.kGrey1,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0.sp,
                              ),
                            ),
                            Text(
                              amPm,
                              style: TextStyle(
                                color: TAppColors.kGrey1,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.0.w,
                        ),
                        CachedNetworkImage(
                          height: 32.0.w,
                          width: 32.0.w,
                          imageUrl:
                              matchModel.participants!.first.meta!.location ==
                                      'away'
                                  ? matchModel.participants!.first.imagePath!
                                  : matchModel.participants!.last.imagePath!,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: Text(
                        awayName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: TAppColors.kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: const Color(0xff222232),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$goalHome - $goalAway',
                      style: TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0.sp,
                      ),
                    ),
                    const Divider(
                      color: TAppColors.kGrey2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Text(
                      matchModel.state!.shortName!,
                      style: TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
