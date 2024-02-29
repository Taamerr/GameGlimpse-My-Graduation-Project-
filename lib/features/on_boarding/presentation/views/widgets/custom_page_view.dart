import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../data/models/on_boarding_model.dart';
import 'on_boarding_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});
  static final List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
      image: TAppAssets.onBoarding1,
      title: 'Offer every fan a home for their football audience.',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding2,
      title: 'Check the latest score',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding3,
      title: 'Keep up with your favorite teams and players',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding4,
      title: 'Follow every moment of the sport',
    ),
  ];
  static var boardingController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: boardingController,
            itemBuilder: (context, index) => OnBoardingItem(
              onBoardingModel: onBoardingItems[index],
            ),
            itemCount: onBoardingItems.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: boardingController,
              count: onBoardingItems.length,
              effect: const ExpandingDotsEffect(
                dotColor: Color(0xff67686D),
                activeDotColor: TAppColors.kWhite,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 4,
                spacing: 5.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
