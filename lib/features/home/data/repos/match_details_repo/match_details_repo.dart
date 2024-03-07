import 'package:dartz/dartz.dart';
import '../../models/match_stat_model/match_stat_model.dart';

import '../../../../../core/error/failures.dart';

abstract class MatchDetailsRepo {
  Future<Either<Failure, MatchStatModel>> getMatchStat({
    required int fixtureId,
  });
}
