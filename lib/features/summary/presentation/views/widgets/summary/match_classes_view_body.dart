import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp_app/core/constants/assets.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/features/summary/data/models/video_model.dart';
import 'package:gp_app/features/summary/presentation/views/widgets/summary/match_classes_view_appbar.dart';
import 'package:gp_app/features/summary/presentation/views/widgets/summary/play_video_view.dart';

class MatchClassesViewBody extends StatelessWidget {
  const MatchClassesViewBody({
    super.key,
    required this.videoModel,
  });
  final VideoModel videoModel;
  static const List<String> textList = [
    'Full Summary',
    'Goals',
    'Shots',
    'Red Cards',
  ];
  static const List<String> assets = [
    TAppAssets.fullSummary,
    TAppAssets.goals,
    TAppAssets.shots,
    TAppAssets.redCards,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 16.h,
        bottom: 6.h,
      ),
      child: Column(
        children: [
          const MatchClassesViewAppBar(),
          SizedBox(
            height: 16.0.h,
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 250,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return MatchClassItem(
                    videoModel: videoModel,
                    textList: textList,
                    index: index,
                    assetName: assets[index],
                  );
                },
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MatchClassItem extends StatelessWidget {
  const MatchClassItem({
    super.key,
    required this.videoModel,
    required this.textList,
    required this.index,
    required this.assetName,
  });

  final VideoModel videoModel;
  final List<String> textList;
  final int index;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayVideoView(
              videoLink: videoModel.matchDocModel.matchClasses![index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff2B2B3D),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0.r),
                    bottomRight: Radius.circular(16.0.r),
                  ),
                ),
                child: Text(
                  textList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0.sp,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image(
                width: 100.0.w,
                height: 100.0.w,
                image: AssetImage(
                  assetName,
                ),
                color: index != 3 ? TAppColors.kWhite : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
