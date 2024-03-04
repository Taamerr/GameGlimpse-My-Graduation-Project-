import 'package:flutter/material.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';

class CustomMatchesAppBar extends StatelessWidget {
  const CustomMatchesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'LiveScore',
          style: TextStyle(
            color: TAppColors.kWhite,
            fontWeight: FontWeight.w500,
            fontSize: 24.0,
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              IconBroken.Notification,
              color: TAppColors.kWhite,
              size: 28.0,
            )),
      ],
    );
  }
}
