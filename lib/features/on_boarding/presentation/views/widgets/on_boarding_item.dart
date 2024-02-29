import 'package:flutter/material.dart';

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
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 340,
                  decoration: BoxDecoration(
                    color: TAppColors.kBlack3,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                    onBoardingModel.image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          onBoardingModel.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
