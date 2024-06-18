import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/league_standing_model/datum.dart';

class StandingItem extends StatelessWidget {
  const StandingItem({
    super.key,
    required this.teamData,
  });
  final Datum teamData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  '${teamData.position!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                CachedNetworkImage(
                  height: 36.0.w,
                  width: 36.0.w,
                  imageUrl: teamData.participant!.imagePath!,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.21).w,
                  child: Text(
                    teamData.participant!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${teamData.details![0].value}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![1].value}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![2].value}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![3].value}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![4].value}/${teamData.details![5].value}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![18].value!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                Text(
                  '${teamData.details![21].value!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
