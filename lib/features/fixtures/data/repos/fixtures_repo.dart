import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../models/fixtures_model/fixtures_model.dart';

abstract class FixturesRepo {
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
    String? pageNumber,
  });

  Future<Either<Failure, FixturesModel>> getFixuresDatePicked({
    required int perPage,
    required String pickedDate,
    String? pageNumber,
  });
}
