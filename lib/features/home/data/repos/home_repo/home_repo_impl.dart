// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/core/utils/cache_helper.dart';
import 'package:gp_app/features/auth/data/models/user_model.dart';
import 'package:gp_app/features/home/data/models/fixtures_model/fixtures_model.dart';
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
        endPoint:
            'football/fixtures/between/$startDate/$endDate',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'league:name,image_path;state:short_name;participants:name,short_code,image_path;scores;',
          'timezone': 'Africa/Cairo',
          'per_page': perPage,
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
      return right(null);
    } catch (e) {
      print('Error when sign out: ${e.toString()}');
      return left('Error when sign out: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> getUserData({required String uId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        Constants.userModel = UserModel.fromJson(json: value.data()!);
      });
      return right(null);
    } catch (e) {
      print('Error when get user data : ${e.toString()}');
      return left('Error when get user data : ${e.toString()}');
    }
  }
}
