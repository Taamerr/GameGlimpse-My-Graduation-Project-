import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../view_model/video_summary_cubit/video_summary_cubit.dart';
import 'video_summary_item.dart';

class VideosSummaryViewBody extends StatelessWidget {
  const VideosSummaryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoSummaryCubit, VideoSummaryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = VideoSummaryCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: 6,
          ),
          child: state is VideoSummaryGetAllMatchesLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: TAppColors.kBlue,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => VideoSummaryItem(
                    videoModel: cubit.videoModelList[index],
                  ),
                  itemCount: cubit.videoModelList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 24.0,
                  ),
                ),
        );
      },
    );
  }
}
