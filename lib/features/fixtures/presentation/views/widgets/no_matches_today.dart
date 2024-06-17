import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';

class NoMatchesToday extends StatelessWidget {
  const NoMatchesToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width / 4).w,
          height: (MediaQuery.of(context).size.width / 4).w,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: const Image(
            image: AssetImage(TAppAssets.noMatchesToday),
            color: TAppColors.kWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'No matches for this day',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.0.sp,
          ),
        ),
      ],
    );
  }
}
