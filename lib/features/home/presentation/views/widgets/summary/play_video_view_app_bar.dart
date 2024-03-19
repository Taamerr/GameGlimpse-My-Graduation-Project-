import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/utils/icons/icon_broken.dart';

class PlayVideoViewAppBar extends StatelessWidget {
  const PlayVideoViewAppBar({super.key});

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
      ],
    );
  }
}
