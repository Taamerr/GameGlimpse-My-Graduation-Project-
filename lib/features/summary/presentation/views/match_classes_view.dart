import 'package:flutter/material.dart';
import '../../data/models/video_model.dart';
import 'widgets/summary/match_classes_view_body.dart';

class MatchClassesView extends StatelessWidget {
  const MatchClassesView({
    super.key,
    required this.videoModel,
  });
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MatchClassesViewBody(
          videoModel: videoModel,
        ),
      ),
    );
  }
}
