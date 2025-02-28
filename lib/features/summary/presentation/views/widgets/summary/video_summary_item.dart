import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/cache_helper.dart';
import '../../../../data/models/video_model.dart';
import '../../../view_model/video_summary_cubit/video_summary_cubit.dart';
import '../../match_classes_view.dart';
import 'video_summary_team_row.dart';

class VideoSummaryItem extends StatelessWidget {
  const VideoSummaryItem({
    super.key,
    required this.videoModel,
    required this.favList,
  });
  final VideoModel videoModel;
  final List<String> favList;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(videoModel.matchDocModel.date!);
    String matchDate = DateFormat("dd MMM yyyy").format(dateTime);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchClassesView(
              videoModel: videoModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
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
                          Row(
                            children: [
                              Text(
                                //here
                                Constants.countryNames[
                                    videoModel.videoMatchData.league!.id]!,
                                style: TextStyle(
                                  color: const Color(0xffAAAAAA),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                matchDate,
                                style: TextStyle(
                                  color: const Color(0xffAAAAAA),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      CacheHelper.getData(key: 'uId') != null &&
                              Constants.userModel != null
                          ? BlocConsumer<VideoSummaryCubit, VideoSummaryState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                var cubit = VideoSummaryCubit.get(context);
                                return Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      favList.contains(
                                              (videoModel.matchDocModel.matchId)
                                                  .toString())
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: favList.contains(
                                              (videoModel.matchDocModel.matchId)
                                                  .toString())
                                          ? Colors.red
                                          : TAppColors.kGrey2,
                                      size: 32.0,
                                    ),
                                    onPressed: () {
                                      cubit.updateFavoriteMatchList(
                                        uId: CacheHelper.getData(key: 'uId'),
                                        matchId:
                                            (videoModel.matchDocModel.matchId)
                                                .toString(),
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  VideoSummaryTeamsRow(
                    videoModel: videoModel,
                  ),
                  SizedBox(
                    height: 12.h,
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
