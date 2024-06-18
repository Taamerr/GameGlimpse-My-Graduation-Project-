import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../data/models/match_doc_model/video_model.dart';

class VideoSummaryTeamsRow extends StatelessWidget {
  const VideoSummaryTeamsRow({
    super.key,
    required this.videoModel,
  });
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    String homeName = '';
    String awayName = '';
    if (videoModel.videoMatchData.participants!.first.meta!.location ==
        'home') {
      homeName = videoModel.videoMatchData.participants!.first.name!;
      awayName = videoModel.videoMatchData.participants!.last.name!;
    } else if (videoModel.videoMatchData.participants!.first.meta!.location ==
        'away') {
      awayName = videoModel.videoMatchData.participants!.first.name!;
      homeName = videoModel.videoMatchData.participants!.last.name!;
    }
    int goalHome = 0;
    int goalAway = 0;
    for (var score in videoModel.videoMatchData.scores!) {
      if (score.description == 'CURRENT' &&
          score.scoreData!.participant == 'home') {
        goalHome = score.scoreData!.goals!;
      } else if (score.description == 'CURRENT' &&
          score.scoreData!.participant == 'away') {
        goalAway = score.scoreData!.goals!;
      }
    }
    return Expanded(
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
                    width: 54.w,
                    height: 54.w,
                    imageUrl: videoModel.videoMatchData.participants!.first
                                .meta!.location ==
                            'home'
                        ? videoModel
                            .videoMatchData.participants!.first.imagePath!
                        : videoModel
                            .videoMatchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
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
                videoModel.videoMatchData.state!.shortName!,
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
                    width: 54.w,
                    height: 54.w,
                    imageUrl: videoModel.videoMatchData.participants!.first
                                .meta!.location ==
                            'away'
                        ? videoModel
                            .videoMatchData.participants!.first.imagePath!
                        : videoModel
                            .videoMatchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
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
