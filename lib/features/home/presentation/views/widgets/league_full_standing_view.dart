import 'package:flutter/material.dart';
import '../../../data/models/league_standing_model/league_standing_model.dart';
import 'league_full_standing_body.dart';

class LeagueFullStandingView extends StatelessWidget {
  const LeagueFullStandingView({super.key, required this.model});
final LeagueStandingModel model;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: LeagueFullStandingViewBody(
          model: model,
        ),
      ),
    );
  }
}
