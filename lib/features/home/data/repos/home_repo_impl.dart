// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/core/utils/cache_helper.dart';
import 'package:gp_app/features/auth/data/models/user_model.dart';
import 'package:gp_app/features/home/data/models/fixture_model/fixtures_model.dart';
import 'package:gp_app/features/home/data/models/standings_model/standings_model.dart';
import 'package:gp_app/features/home/data/repos/home_repo.dart';
import 'package:image_picker/image_picker.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this.apiService,
  });
  ApiService apiService;
  @override
  Future<Either<Failure, FixturesModel>> fetchFixuresMatches({
    required String league,
    required String season,
    required String date,
    required String rapidApiKey,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'fixtures',
        headers: {
          'x-rapidapi-host': 'v3.football.api-sports.io',
          'x-rapidapi-key': rapidApiKey,
        },
        queryParameters: {
          'league': league,
          'season': season,
          'date': date,
        },
      );
      FixturesModel fixtureModel = FixturesModel.fromJson(data);
      print(fixtureModel.response!.first.teams!.home!.name);
      return right(fixtureModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StandingsModel>> fetchStandingsLeagues({
    required String league,
    required String season,
    required String rapidApiKey,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'standings',
        headers: {
          'x-rapidapi-host': 'v3.football.api-sports.io',
          'x-rapidapi-key': rapidApiKey,
        },
        queryParameters: {
          'league': league,
          'season': season,
        },
      );
      StandingsModel standingsModel = StandingsModel.fromJson(data);
      return right(standingsModel);
    } catch (e) {
      print(e.toString());
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

  @override
  Future<Either<String, File?>> getProfileImage(
      {required ImagePicker picker}) async {
    try {
      File? profileImage;
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        return right(profileImage);
      }
      return right(profileImage);
    } catch (e) {
      return left('Error when pick profile image : ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> uploadProfileImage(
      {required File profileImage}) async {
    try {
      var result = await FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(profileImage.path).pathSegments.last}')
          .putFile(profileImage);
      String downloadUrl = await result.ref.getDownloadURL();
      return right(downloadUrl);
    } catch (e) {
      return left('Error when upload profile image : ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> updateUserData() {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}
