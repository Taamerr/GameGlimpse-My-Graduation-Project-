// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/core/utils/cache_helper.dart';
import 'package:gp_app/features/home/data/models/fixtures_model/fixtures_model.dart';
import 'package:gp_app/features/home/data/models/league_standing_model/league_standing_model.dart';
import 'package:gp_app/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this.apiService,
  });
  ApiService apiService;
  @override
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required int perPage,
    required String startDate,
    required String endDate,
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
  Future<Either<String, void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      CacheHelper.removeData(key: 'uId');
      CacheHelper.removeData(key: 'inco');
      Constants.userModel = null;
      return right(null);
    } catch (e) {
      print('Error when sign out: ${e.toString()}');
      return left('Error when sign out: ${e.toString()}');
    }
  }

  

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
