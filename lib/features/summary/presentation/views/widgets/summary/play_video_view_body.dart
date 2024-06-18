import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'play_video_view_app_bar.dart';

class PlayVideoViewBody extends StatefulWidget {
  const PlayVideoViewBody({
    super.key,
    required this.videoLink,
  });
  final String videoLink;

  @override
  State<PlayVideoViewBody> createState() => _PlayVideoViewBodyState();
}

class _PlayVideoViewBodyState extends State<PlayVideoViewBody> {
  late FlickManager flickManager;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoLink));
    flickManager = FlickManager(videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 12.0.h,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const PlayVideoViewAppBar(),
            const Spacer(),
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
