import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../models/league_standing_model/league_standing_model.dart';

abstract class StandingsRepo {
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithLeagueId({
    required int leagueId,
  });
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithSeasonId({
    required int seasonId,
  });
}