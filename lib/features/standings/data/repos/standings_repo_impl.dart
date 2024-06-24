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
  Future<Either<Failure, List<LeagueStandingModel>>>
      fetchLeagueStandingWithLeagueId({
    required List<int> leagueId,
    required List<LeagueStandingModel> leaguesStandingList,
  }) async {
    try {
      if (leagueId.isEmpty) return right(leaguesStandingList);
      var result = await apiService.get(
        endPoint: 'football/standings/live/leagues/${leagueId[0]}',
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
      if (leagueStandingModel.data == null) {
        return left(ServerFailure('No data found'));
      }
      leaguesStandingList.add(leagueStandingModel);
      leagueId.removeAt(0);
      await fetchLeagueStandingWithLeagueId(
        leagueId: leagueId,
        leaguesStandingList: leaguesStandingList,
      );
      return right(leaguesStandingList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LeagueStandingModel>>>
      fetchLeagueStandingWithSeasonId({
    required List<int> seasonId,
    required List<LeagueStandingModel> leaguesStandingList,
  }) async {
    try {
      if (seasonId.isEmpty) return right(leaguesStandingList);
      var result = await apiService.get(
        endPoint: 'football/standings/seasons/${seasonId[0]}',
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
      if (leagueStandingModel.data == null) {
        return left(ServerFailure('No data found'));
      }
      leaguesStandingList.add(leagueStandingModel);
      seasonId.removeAt(0);
      await fetchLeagueStandingWithSeasonId(
        seasonId: seasonId,
        leaguesStandingList: leaguesStandingList,
      );
      return right(leaguesStandingList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
