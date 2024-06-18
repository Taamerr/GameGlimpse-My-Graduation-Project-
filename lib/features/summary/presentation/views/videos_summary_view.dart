import 'package:flutter/material.dart';

import 'widgets/summary/videos_summary_view_body.dart';

class VideosSummaryView extends StatelessWidget {
  const VideosSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: VideosSummaryViewBody(),
      ),
    );
  }
}
