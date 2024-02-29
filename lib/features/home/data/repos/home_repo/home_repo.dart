import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../models/fixture_model/fixtures_model.dart';
import '../../models/standings_model/standings_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required String league,
    required String season,
    required String date,
    required String rapidApiKey,
  });
  Future<Either<Failure, StandingsModel>> fetchStandingsLeagues({
    required String league,
    required String season,
    required String rapidApiKey,
  });

  Future<Either<String, void>> signOut();
  Future<Either<String, void>> getUserData({required String uId});
}
