import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/models/fixtures_model/match_data.dart';

class MatchDetailsBodyUpperPart extends StatelessWidget {
  const MatchDetailsBodyUpperPart({
    super.key,
    required this.matchData,
  });
  final MatchData matchData;
  @override
  Widget build(BuildContext context) {
    String homeName = '';
    String awayName = '';
    if (matchData.participants!.first.meta!.location == 'home') {
      homeName = matchData.participants!.first.name!;
      awayName = matchData.participants!.last.name!;
    } else if (matchData.participants!.first.meta!.location == 'away') {
      awayName = matchData.participants!.first.name!;
      homeName = matchData.participants!.last.name!;
    }
    int goalHome = 0;
    int goalAway = 0;
    for (var score in matchData.scores!) {
      if (score.description == 'CURRENT' &&
          score.score!.participant == 'home') {
        goalHome = score.score!.goals!;
      } else if (score.description == 'CURRENT' &&
          score.score!.participant == 'away') {
        goalAway = score.score!.goals!;
      }
    }
    return SizedBox(
      height: (MediaQuery.of(context).size.height * 0.25).h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff222232),
                  radius: 50.r,
                  child: CachedNetworkImage(
                    width: 56.w,
                    height: 56.w,
                    imageUrl:
                        matchData.participants!.first.meta!.location == 'home'
                            ? matchData.participants!.first.imagePath!
                            : matchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  homeName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Text(
                    '$goalHome - $goalAway',
                    style: TextStyle(
                      color: TAppColors.kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 32.0.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Text(
                matchData.state!.shortName!,
                style: TextStyle(
                  color: TAppColors.kWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0.sp,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff222232),
                  radius: 50.r,
                  child: CachedNetworkImage(
                    width: 56.w,
                    height: 56.w,
                    imageUrl:
                        matchData.participants!.first.meta!.location == 'away'
                            ? matchData.participants!.first.imagePath!
                            : matchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  awayName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
