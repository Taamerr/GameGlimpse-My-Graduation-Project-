import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/icons/icon_broken.dart';

class CustomLeagueHeader extends StatelessWidget {
  const CustomLeagueHeader({
    super.key,
    required this.imageUrl,
    required this.leagueName,
    required this.leagueId,
    required this.iconPressed,
  });

  final String imageUrl;
  final String leagueName;
  final int leagueId;
  final void Function()? iconPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          color: leagueId == 8 || leagueId == 2 ? TAppColors.kWhite : null,
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
              leagueName,
              style:  TextStyle(
                color: TAppColors.kWhite,
                fontWeight: FontWeight.w600,
                fontSize: 16.0.sp,
              ),
            ),
            Text(
              Constants.countryNames[leagueId]!,
              style:  TextStyle(
                color: Color(0xffAAAAAA),
                fontWeight: FontWeight.w400,
                fontSize: 12.0.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: iconPressed,
          icon:  Icon(
            IconBroken.Arrow___Right_2,
            color: TAppColors.kWhite,
            size: 28.0.r,
          ),
        )
      ],
    );
  }
}
