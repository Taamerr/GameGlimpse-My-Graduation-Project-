import 'package:dartz/dartz.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/features/home/data/models/league_standing_model/league_standing_model.dart';

abstract class StandingsRepo {
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithLeagueId({
    required int leagueId,
  });
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithSeasonId({
    required int seasonId,
  });
}