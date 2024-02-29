import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            size: 32.0,
            color: TAppColors.kGrey1,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
