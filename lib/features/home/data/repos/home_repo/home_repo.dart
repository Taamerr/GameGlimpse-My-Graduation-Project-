import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../fixtures/data/models/fixtures_model/fixtures_model.dart';
import '../../models/league_standing_model/league_standing_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStanding({
    required int leagueId,
  });
}
