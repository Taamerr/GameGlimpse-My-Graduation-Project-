import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/fixtures_model.dart';
import 'package:gp_app/features/fixtures/data/repos/fixtures_repo.dart';

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
    String pageNumber = '1',
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
}
