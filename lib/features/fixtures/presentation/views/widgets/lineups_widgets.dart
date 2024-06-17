import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  height: (MediaQuery.of(context).size.height * 0.45).h,
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width).w,
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
                        SizedBox(
                          height: 12.h,
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
                        SizedBox(
                          height: 12.h,
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
                        SizedBox(
                          height: 12.h,
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
                        SizedBox(
                          height: 12.h,
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
                        SizedBox(
                          height: 12.0.h,
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
            width: 60.0.w,
            height: 60.0.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: TAppColors.kWhite,
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
          width: 60.w,
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0.sp,
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
