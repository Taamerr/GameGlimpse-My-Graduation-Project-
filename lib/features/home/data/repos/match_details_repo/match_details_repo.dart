import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../fixtures/data/models/match_stat_model/match_stat_model.dart';

abstract class MatchDetailsRepo {
  Future<Either<Failure, MatchStatModel>> getMatchStat({
    required int fixtureId,
  });
}
