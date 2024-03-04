import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/icons/icon_broken.dart';
import '../../../data/models/fixtures_model/match_data.dart';
import 'custom_match_card.dart';

class CustomLeagueMatches extends StatelessWidget {
  const CustomLeagueMatches({
    super.key,
    required this.matchModelList,
  });
  final List<MatchData> matchModelList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: matchModelList.first.league!.imagePath!,
                color: matchModelList.first.league!.id == 8 ||
                        matchModelList.first.league!.id == 2
                    ? TAppColors.kWhite
                    : null,
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
                    matchModelList.first.league!.name!,
                    style: const TextStyle(
                      color: TAppColors.kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    Constants.countryNames[matchModelList.first.league!.id!]!,
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
            matchModel: matchModelList[index],
          ),
          itemCount: matchModelList.length,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
