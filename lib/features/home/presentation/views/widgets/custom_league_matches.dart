import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';
import 'package:gp_app/features/home/data/models/matches_model/matches_model.dart';
import 'package:gp_app/features/home/presentation/views/widgets/custom_match_card.dart';

class CustomLeagueMatches extends StatelessWidget {
  const CustomLeagueMatches({
    super.key,
    required this.matchesModel,
  });
  final MatchesModel matchesModel;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 55,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    matchesModel.fixturesModel.response!.first.league!.logo!,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    matchesModel.fixturesModel.response!.first.league!.name!,
                    style: const TextStyle(
                      color: TAppColors.kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    matchesModel.fixturesModel.response!.first.league!.country!,
                    style: const TextStyle(
                      color: Color(0xffAAAAAA),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.Arrow___Right_2,
                  color: TAppColors.kWhite,
                  size: 28.0,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomMatchCard(
            response: matchesModel.fixturesModel.response![index],
          ),
          itemCount: matchesModel.fixturesModel.response!.length,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
