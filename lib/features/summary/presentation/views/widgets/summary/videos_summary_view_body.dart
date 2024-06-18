import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';
import 'package:gp_app/core/widgets/custom_text_field.dart';

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
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 16.h,
            bottom: 6.h,
          ),
          child: state is VideoSummaryGetAllMatchesLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: TAppColors.kBlue,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          CustomTextField(
                            fillColor: const Color(0xff2B2B3D),
                            hintText: 'Search',
                            hintTextColor: TAppColors.kWhite,
                            textColor: TAppColors.kGrey2,
                            cursorColor: TAppColors.kGrey2,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconBroken.Search,
                                color: TAppColors.kGrey2,
                              ),
                            ),
                            onChanged: (value) {
                              cubit.searchVideo(searchText: value);
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
                    cubit.searchVideos.isNotEmpty
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => VideoSummaryItem(
                                videoModel: cubit.searchVideos[index],
                              ),
                              childCount: cubit.searchVideos.length,
                            ),
                          )
                        : const SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: TAppColors.kBlue,
                              ),
                            ),
                          ),
                  ],
                ),
        );
      },
    );
  }
}
