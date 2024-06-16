import 'package:dartz/dartz.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/fixtures_model.dart';

abstract class FixturesRepo{
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
  });
}