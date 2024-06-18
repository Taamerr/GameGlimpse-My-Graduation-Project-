import 'package:flutter/material.dart';

import 'play_video_view_body.dart';

class PlayVideoView extends StatelessWidget {
  const PlayVideoView({
    super.key,
    required this.videoLink,
  });
  final String videoLink;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: PlayVideoViewBody(
          videoLink: videoLink,
        ),
      ),
    );
  }
}
