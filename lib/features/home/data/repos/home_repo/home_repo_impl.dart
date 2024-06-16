// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/fixtures_model.dart';
import 'package:gp_app/features/home/data/models/league_standing_model/league_standing_model.dart';
import 'package:gp_app/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this.apiService,
  });
  ApiService apiService;
  


  @override
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStanding({
    required int leagueId,
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/standings/live/leagues/$leagueId',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'league:name,image_path;participant:name,short_code,image_path;details.type:name;',
          'timezone': 'Africa/Cairo',
          'per_page': 50,
        },
      );
      LeagueStandingModel leagueStandingModel =
          LeagueStandingModel.fromJson(result);
      return right(leagueStandingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
