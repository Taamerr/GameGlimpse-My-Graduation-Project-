import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp_app/features/fixtures/presentation/view_model/fixtures_cubit/fixtures_cubit.dart';

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
              onPressed: () async{
                cubit.getDate();
                await cubit.getAllMatches();
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
      },
    );
  }
}
