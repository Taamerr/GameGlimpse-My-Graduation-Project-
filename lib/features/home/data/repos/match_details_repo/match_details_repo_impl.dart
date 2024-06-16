// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/features/fixtures/data/models/match_stat_model/match_stat_model.dart';
import 'package:gp_app/features/home/data/repos/match_details_repo/match_details_repo.dart';

class MatchDetailsRepoImpl implements MatchDetailsRepo {
  MatchDetailsRepoImpl({
    required this.apiService,
  });

  ApiService apiService;

  @override
  Future<Either<Failure, MatchStatModel>> getMatchStat({
    required int fixtureId,
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/fixtures/$fixtureId',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'lineups.player:display_name,image_path;statistics.type:name;formations;',
          'timezone': 'Africa/Cairo',
          'filters':
              'fixtureStatisticTypes:41,51,83,56,84,54,57,58,86,34,59,49,45,80,82,81,42,50;lineupTypes:11',
          'per_page': 50,
        },
      );
      MatchStatModel matchStatModel = MatchStatModel.fromJson(result);
      return right(matchStatModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
