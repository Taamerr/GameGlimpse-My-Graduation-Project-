// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/core/error/failures.dart';
import 'package:gp_app/core/utils/api_services.dart';
import 'package:gp_app/features/summary/data/models/match_doc_model/match_doc_model.dart';
import 'package:gp_app/features/summary/data/models/video_match_data_model/video_match_data_model.dart';
import 'package:gp_app/features/summary/data/repos/video_summary_repo/video_summ_repo.dart';

class VideoSummaryRepoImpl implements VideoSummaryRepo {
  VideoSummaryRepoImpl({
    required this.apiService,
  });
  ApiService apiService;
  @override
  Future<Either<Failure, List<MatchDocModel>>> getAllMatchDocuments() async {
    try {
      List<MatchDocModel> matchDocModel = [];
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('matches');
      QuerySnapshot querySnapshot = await collectionRef.get();
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        MatchDocModel temp = MatchDocModel.fromFirestore(snapshot: data);
        matchDocModel.add(temp);
      }
      return right(matchDocModel);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VideoMatchDataModel>> getAllMatchVideoData({
    required String matchesId,
  }) async {
    try {
      var result = await apiService.get(
        endPoint: 'football/fixtures/multi/$matchesId',
        headers: {
          'authorization': Constants.apiKey,
        },
        queryParameters: {
          'include':
              'league:name,image_path;state:short_name;participants:name,short_code,image_path;scores:score,description;',
          'timezone': 'Africa/Cairo',
          'per_page': 50,
          'filter': 'scoreTypes:1525',
        },
      );
      VideoMatchDataModel videoMatchDataModel =
          VideoMatchDataModel.fromJson(result);
      return right(videoMatchDataModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateFavoriteMatchList({
    required String uId,
    required List<String> favVideoList,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uId).update({
        'favVideos': favVideoList,
      });
      return right(null);
    } catch (e) {
      print('Error when adding favorite video: ${e.toString()}');
      return left(
          ServerFailure('Error when adding favorite video: ${e.toString()}'));
    }
  }
}
