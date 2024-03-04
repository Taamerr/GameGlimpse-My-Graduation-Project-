import 'package:dartz/dartz.dart';
import '../../models/fixtures_model/fixtures_model.dart';

import '../../../../../core/error/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
  });

  Future<Either<String, void>> signOut();
  Future<Either<String, void>> getUserData({required String uId});
}
