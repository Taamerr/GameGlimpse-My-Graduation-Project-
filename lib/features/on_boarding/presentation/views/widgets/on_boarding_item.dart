import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.onBoardingModel,
  });

  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.5).h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.6).w,
                  height: (MediaQuery.of(context).size.height * 0.38).h,
                  decoration: BoxDecoration(
                    color: TAppColors.kBlack3,
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                  image: AssetImage(
                    onBoardingModel.image,
                  ),
                  fit: BoxFit.fill,
                  height: (MediaQuery.of(context).size.height * 0.45).h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Text(
          onBoardingModel.title,
          style: TextStyle(
            fontSize: 24.0.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
