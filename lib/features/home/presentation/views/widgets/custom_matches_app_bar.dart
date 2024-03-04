import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/icons/icon_broken.dart';
import '../../view_model/home_cubit/home_cubit.dart';

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
          onPressed: () {
            HomeCubit.get(context).getAllMatches();
          },
          icon: const Icon(
            FontAwesomeIcons.rotate,
            color: TAppColors.kWhite,
            size: 24.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconBroken.Notification,
            color: TAppColors.kWhite,
            size: 28.0,
          ),
        ),
      ],
    );
  }
}
