import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/api_services.dart';
import '../models/league_standing_model/league_standing_model.dart';
import 'standings_repo.dart';

class StandingsRepoImpl implements StandingsRepo {
  StandingsRepoImpl({
    required this.apiService,
  });
  ApiService apiService;
  


  @override
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithLeagueId({
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

  @override
  Future<Either<Failure, LeagueStandingModel>> fetchLeagueStandingWithSeasonId({
    required int seasonId,
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/standings/seasons/$seasonId',
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
