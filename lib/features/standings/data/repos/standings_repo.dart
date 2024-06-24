import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../models/league_standing_model/league_standing_model.dart';

abstract class StandingsRepo {
  Future<Either<Failure, List<LeagueStandingModel>>> fetchLeagueStandingWithLeagueId({
    required List<int> leagueId,
    required List<LeagueStandingModel> leaguesStandingList,
  });
  Future<Either<Failure, List<LeagueStandingModel>>> fetchLeagueStandingWithSeasonId({
    required List<int> seasonId,
    required List<LeagueStandingModel> leaguesStandingList,
  });
}