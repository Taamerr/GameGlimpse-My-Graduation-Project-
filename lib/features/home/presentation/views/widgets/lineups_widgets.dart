import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../view_model/match_details_cubit/match_details_cubit.dart';

class LineUps extends StatelessWidget {
  const LineUps({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MatchDetailsCubit, MatchDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MatchDetailsCubit.get(context);
        return state is MatchDetailsGetMatchStatsLoadingState
            ? Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: TAppColors.kBlue,
                    ),
                  ),
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(TAppAssets.lineupsBackground),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        LineupsPlayerImage(
                          imageUrl: cubit.teamALineup[0].player!.imagePath!,
                          name: cubit.teamALineup[0].player!.displayName!,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[1].player!.imagePath!,
                              name: cubit.teamALineup[1].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[2].player!.imagePath!,
                              name: cubit.teamALineup[2].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[3].player!.imagePath!,
                              name: cubit.teamALineup[3].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[4].player!.imagePath!,
                              name: cubit.teamALineup[4].player!.displayName!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[5].player!.imagePath!,
                              name: cubit.teamALineup[5].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[6].player!.imagePath!,
                              name: cubit.teamALineup[6].player!.displayName!,
                            ),
                          ],
                        ),
                        LineupsPlayerImage(
                          imageUrl: cubit.teamALineup[7].player!.imagePath!,
                          name: cubit.teamALineup[7].player!.displayName!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[8].player!.imagePath!,
                              name: cubit.teamALineup[8].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamALineup[9].player!.imagePath!,
                              name: cubit.teamALineup[9].player!.displayName!,
                            ),
                          ],
                        ),
                        LineupsPlayerImage(
                          imageUrl: cubit.teamALineup[10].player!.imagePath!,
                          name: cubit.teamALineup[10].player!.displayName!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(TAppAssets.lineupsBackground),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        LineupsPlayerImage(
                          imageUrl: cubit.teamBLineup[10].player!.imagePath!,
                          name: cubit.teamBLineup[10].player!.displayName!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[9].player!.imagePath!,
                              name: cubit.teamBLineup[9].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[8].player!.imagePath!,
                              name: cubit.teamBLineup[8].player!.displayName!,
                            ),
                          ],
                        ),
                        LineupsPlayerImage(
                          imageUrl: cubit.teamBLineup[6].player!.imagePath!,
                          name: cubit.teamBLineup[6].player!.displayName!,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[7].player!.imagePath!,
                              name: cubit.teamBLineup[7].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[5].player!.imagePath!,
                              name: cubit.teamBLineup[5].player!.displayName!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[4].player!.imagePath!,
                              name: cubit.teamBLineup[4].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[3].player!.imagePath!,
                              name: cubit.teamBLineup[3].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[2].player!.imagePath!,
                              name: cubit.teamBLineup[2].player!.displayName!,
                            ),
                            LineupsPlayerImage(
                              imageUrl: cubit.teamBLineup[1].player!.imagePath!,
                              name: cubit.teamBLineup[1].player!.displayName!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        LineupsPlayerImage(
                          imageUrl: cubit.teamBLineup[0].player!.imagePath!,
                          name: cubit.teamBLineup[0].player!.displayName!,
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}

class LineupsPlayerImage extends StatelessWidget {
  const LineupsPlayerImage({
    super.key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: TAppColors.kWhite,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
