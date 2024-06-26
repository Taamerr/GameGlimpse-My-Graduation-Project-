import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/icons/icon_broken.dart';

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
          icon: Icon(
            IconBroken.Arrow___Left_2,
            size: 32.0.r,
            color: TAppColors.kGrey1,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24.0.sp,
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
