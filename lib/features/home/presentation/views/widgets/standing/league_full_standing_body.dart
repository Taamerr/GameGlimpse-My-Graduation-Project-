import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../data/models/league_standing_model/league_standing_model.dart';
import 'custom_standing_item.dart';
import 'league_full_standing_app_bar.dart';
import 'standing_header_first_row.dart';

class LeagueFullStandingViewBody extends StatelessWidget {
  const LeagueFullStandingViewBody({super.key, required this.model});
  final LeagueStandingModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
        bottom: 12.0,
      ),
      child: ListView(
        children: [
          const LeagueFullStandingAppBar(),
          CircleAvatar(
            backgroundColor: const Color(0xff222232),
            radius: MediaQuery.of(context).size.width * 0.22,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.35,
              color:
                  model.data!.first.league!.id == 8 ? TAppColors.kWhite : null,
              imageUrl: model.data!.first.league!.imagePath!,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            model.data!.first.league!.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          const StandingsHeaderFirstRow(),
          const SizedBox(
            height: 6,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => StandingItem(
              teamData: model.data![index],
            ),
            separatorBuilder: (context, index) => const Divider(
              color: TAppColors.kGrey2,
              thickness: 0.3,
            ),
            itemCount: model.data!.length,
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
