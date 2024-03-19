import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: BoxDecoration(
          color: const Color(0xff2B2B3D),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CachedNetworkImage(
                    width: 36,
                    height: 36,
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
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoModel.videoMatchData.league!.name!,
                        style: const TextStyle(
                          color: TAppColors.kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        Constants.countryNames[
                            videoModel.videoMatchData.league!.id]!,
                        style: const TextStyle(
                          color: Color(0xffAAAAAA),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              VideoSummaryTeamsRow(
                videoModel: videoModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
