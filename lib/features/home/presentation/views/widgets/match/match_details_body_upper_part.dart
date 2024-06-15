import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../data/models/fixtures_model/match_data.dart';

class MatchDetailsBodyUpperPart extends StatelessWidget {
  const MatchDetailsBodyUpperPart({
    super.key,
    required this.matchData,
  });
  final MatchData matchData;
  @override
  Widget build(BuildContext context) {
    String homeName = '';
    String awayName = '';
    if (matchData.participants!.first.meta!.location == 'home') {
      homeName = matchData.participants!.first.name!;
      awayName = matchData.participants!.last.name!;
    } else if (matchData.participants!.first.meta!.location == 'away') {
      awayName = matchData.participants!.first.name!;
      homeName = matchData.participants!.last.name!;
    }
    int goalHome = 0;
    int goalAway = 0;
    for (var score in matchData.scores!) {
      if (score.description == 'CURRENT' &&
          score.score!.participant == 'home') {
        goalHome = score.score!.goals!;
      } else if (score.description == 'CURRENT' &&
          score.score!.participant == 'away') {
        goalAway = score.score!.goals!;
      }
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff222232),
                  radius: 50,
                  child: CachedNetworkImage(
                    width: 54,
                    height: 54,
                    imageUrl:
                        matchData.participants!.first.meta!.location == 'home'
                            ? matchData.participants!.first.imagePath!
                            : matchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  homeName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Text(
                    '$goalHome - $goalAway',
                    style: const TextStyle(
                      color: TAppColors.kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 32.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                matchData.state!.shortName!,
                style: const TextStyle(
                  color: TAppColors.kWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff222232),
                  radius: 50,
                  child: CachedNetworkImage(
                    width: 54,
                    height: 54,
                    imageUrl:
                        matchData.participants!.first.meta!.location == 'away'
                            ? matchData.participants!.first.imagePath!
                            : matchData.participants!.last.imagePath!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  awayName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
