import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../models/fixtures_model/fixtures_model.dart';
import '../../models/league_standing_model/league_standing_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
  });
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStanding({
    required int leagueId,
  });

  Future<Either<String, void>> signOut();
}
