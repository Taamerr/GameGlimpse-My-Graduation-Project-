import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../data/models/match_doc_model/video_model.dart';
import 'play_video_view.dart';
import 'video_summary_team_row.dart';

class VideoSummaryItem extends StatelessWidget {
  const VideoSummaryItem({
    super.key,
    required this.videoModel,
  });
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayVideoView(
              videoLink: videoModel.matchDocModel.videoLink!,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height * 0.35).h,
            decoration: BoxDecoration(
              color: const Color(0xff2B2B3D),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      CachedNetworkImage(
                        width: 36.w,
                        height: 36.w,
                        imageUrl: videoModel.videoMatchData.league!.imagePath!,
                        color: videoModel.videoMatchData.league!.id == 8 ||
                                videoModel.videoMatchData.league!.id == 2
                            ? TAppColors.kWhite
                            : null,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videoModel.videoMatchData.league!.name!,
                            style: TextStyle(
                              color: TAppColors.kWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0.sp,
                            ),
                          ),
                          Text(
                            Constants.countryNames[
                                videoModel.videoMatchData.league!.id]!,
                            style: TextStyle(
                              color: const Color(0xffAAAAAA),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  VideoSummaryTeamsRow(
                    videoModel: videoModel,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.0.h,
          ),
        ],
      ),
    );
  }
}
