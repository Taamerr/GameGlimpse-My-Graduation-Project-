import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../view_model/fixtures_cubit/fixtures_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/icons/icon_broken.dart';

class CustomMatchesAppBar extends StatelessWidget {
  const CustomMatchesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixturesCubit, FixturesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FixturesCubit.get(context);
        return Row(
          children: [
            Text(
              'LiveScore',
              style: TextStyle(
                color: TAppColors.kWhite,
                fontWeight: FontWeight.w500,
                fontSize: 26.0.sp,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                await cubit.initialize();
              },
              icon: Icon(
                FontAwesomeIcons.rotate,
                color: TAppColors.kWhite,
                size: 24.0.r,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Notification,
                color: TAppColors.kWhite,
                size: 28.0.r,
              ),
            ),
          ],
        );
      },
    );
  }
}
