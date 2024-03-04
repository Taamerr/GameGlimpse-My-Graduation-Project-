import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/features/home/data/models/fixture_model/response.dart';
import 'package:intl/intl.dart';

class CustomMatchCard extends StatelessWidget {
  const CustomMatchCard({
    super.key,
    required this.response,
  });
  final Response response;

  @override
  Widget build(BuildContext context) {
    num timestampInSeconds = response.fixture!.timestamp!;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        (timestampInSeconds * 1000).toInt(),
        isUtc: true);

    String formattedTime = DateFormat('hh:mm a').format(dateTime.toLocal());

    List<String> parts = formattedTime.split(' '); // Split by space

    String time = parts[0];
    String amPm = parts[1];
    int goalHome = response.goals!.home ?? 0;
    int goalAway = response.goals!.away ?? 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xff2B2B3D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        response.teams!.home!.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: TAppColors.kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Row(
                      children: [
                        CachedNetworkImage(
                          height: 36.0,
                          width: 36.0,
                          imageUrl: response.teams!.home!.logo!,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              time,
                              style: const TextStyle(
                                color: TAppColors.kGrey1,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              amPm,
                              style: const TextStyle(
                                color: TAppColors.kGrey1,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        CachedNetworkImage(
                          height: 36.0,
                          width: 36.0,
                          imageUrl: response.teams!.away!.logo!,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        response.teams!.away!.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: TAppColors.kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xff222232),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$goalHome - $goalAway',
                      style: const TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    const Divider(
                      color: TAppColors.kGrey2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Text(
                      response.fixture!.status!.short!,
                      style: const TextStyle(
                        color: TAppColors.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
