import 'package:flutter/material.dart';
import 'package:gp_app/features/summary/data/models/video_model.dart';
import 'package:gp_app/features/summary/presentation/views/widgets/summary/match_classes_view_body.dart';

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
