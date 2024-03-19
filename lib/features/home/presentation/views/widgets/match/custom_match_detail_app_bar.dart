import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/utils/icons/icon_broken.dart';

class CustomMatchDetailsAppBar extends StatelessWidget {
  const CustomMatchDetailsAppBar({
    super.key,
    required this.leagueName,
  });
  final String leagueName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            size: 32,
            color: TAppColors.kGrey1,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          leagueName,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
