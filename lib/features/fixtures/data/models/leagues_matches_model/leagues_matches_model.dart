import 'package:gp_app/features/fixtures/data/models/fixtures_model/match_data.dart';

class LeaguesMatchesModel {
  List<List<MatchData>> allLeaguesMatches;
  String date;

  LeaguesMatchesModel({required this.allLeaguesMatches, required this.date});
}
