import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/api_services.dart';
import '../../models/fixtures_model/fixtures_model.dart';
import 'fixtures_repo.dart';

class FixturesRepoImpl implements FixturesRepo {
  FixturesRepoImpl({
    required this.apiService,
  });
  ApiService apiService;

  @override
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
    String? pageNumber = '1',
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/fixtures/between/$startDate/$endDate',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'league:name,image_path;state:short_name;participants:name,short_code,image_path;scores;',
          'timezone': 'Africa/Cairo',
          'per_page': perPage,
          'page': pageNumber,
          'filter': 'scoreTypes:1525',
        },
      );
      FixturesModel fixturesModel = FixturesModel.fromJson(result);
      return right(fixturesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FixturesModel>> getFixuresDatePicked({
    required int perPage,
    required String pickedDate,
    String? pageNumber = '1',
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/fixtures/date/$pickedDate',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'league:name,image_path;state:short_name;participants:name,short_code,image_path;scores;',
          'timezone': 'Africa/Cairo',
          'per_page': perPage,
          'page': pageNumber,
          'filter': 'scoreTypes:1525',
        },
      );
      FixturesModel fixturesModel = FixturesModel.fromJson(result);
      return right(fixturesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
