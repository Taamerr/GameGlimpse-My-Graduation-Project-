import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/models/match_doc_model/match_doc_model.dart';
import '../../../data/models/video_model.dart';
import '../../../data/models/video_match_data_model/video_match_data_model.dart';
import '../../../data/repos/video_summary_repo/video_summ_repo.dart';

part 'video_summary_state.dart';

class VideoSummaryCubit extends Cubit<VideoSummaryState> {
  VideoSummaryCubit(this.videoSummaryRepo) : super(VideoSummaryInitial());
  static VideoSummaryCubit get(context) => BlocProvider.of(context);
  final VideoSummaryRepo videoSummaryRepo;

  List<String> favList = [];
  Future<void> updateFavoriteMatchList({
    required String uId,
    required String matchId,
  }) async {
    emit(VideoSummaryGetFavoriteMatchesLoadingState());
    if (Constants.userModel!.favVideos.contains(matchId)) {
      Constants.userModel!.favVideos.remove(matchId);
    } else {
      Constants.userModel!.favVideos.add(matchId);
    }
    favList = Constants.userModel!.favVideos.map((item) => item).toList();
    var result = await videoSummaryRepo.updateFavoriteMatchList(
      favVideoList: Constants.userModel!.favVideos,
      uId: uId,
    );
    result.fold((failure) {
      emit(VideoSummaryGetFavoriteMatchesFailureState(
          errMessage: failure.errMessage));
    }, (_) async {
      emit(VideoSummaryGetFavoriteMatchesSuccessState());
    });
  }

  List<MatchDocModel> matchDocModel = [];
  String matchesList = '';
  VideoMatchDataModel? videoMatchDataModel;
  Future<void> getAllMatchDocuments() async {
    emit(VideoSummaryGetDocLoadingState());
    var result = await videoSummaryRepo.getAllMatchDocuments();
    result.fold((failure) {
      emit(VideoSummaryGetDocFailureState(errMessage: failure.errMessage));
    }, (matchDocModelList) async {
      matchDocModel = matchDocModelList;
      await getMatchesId();
      await getAllMatchesVideoData();
      emit(VideoSummaryGetDocSuccessState());
    });
  }

  Future<void> getMatchesId() async {
    for (var matchDoc in matchDocModel) {
      matchesList += '${matchDoc.matchId},';
    }
    matchesList = matchesList.substring(0, matchesList.length - 1);
  }

  Future<void> getAllMatchesVideoData() async {
    emit(VideoSummaryGetAllMatchesLoadingState());
    var result = await videoSummaryRepo.getAllMatchVideoData(
      matchesId: matchesList,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(VideoSummaryGetAllMatchesFailureState(
          errMessage: failure.errMessage));
    }, (videoMatchData) {
      videoMatchDataModel = videoMatchData;
      fillVideoModelList();
      emit(VideoSummaryGetAllMatchesSuccessState());
    });
  }

  List<VideoModel> videoModelList = [];
  void fillVideoModelList() {
    videoModelList = [];
    for (int i = 0; i < matchDocModel.length; i++) {
      for (int j = 0; j < videoMatchDataModel!.data!.length; j++) {
        if (matchDocModel[i].matchId == videoMatchDataModel!.data![j].id) {
          VideoModel temp = VideoModel(
            matchDocModel: matchDocModel[i],
            videoMatchData: videoMatchDataModel!.data![j],
          );
          videoModelList.add(temp);
        }
      }
    }
    if (Constants.userModel != null) {
      favList = Constants.userModel!.favVideos.map((item) => item).toList();
    }
    searchVideo(searchText: '');
  }

  List<VideoModel> searchVideos = [];
  void searchVideo({required String searchText}) {
    if (isChecked == false) {
      if (searchText.isEmpty) {
        searchVideos = videoModelList.map((item) => item).toList();
      } else {
        String lowerCaseSearchText = searchText.toLowerCase();
        searchVideos = videoModelList.where((item) {
          if (item.matchDocModel.name != null) {
            List<String> teams =
                item.matchDocModel.name!.toLowerCase().split(" vs ");
            return teams.any((team) => team.contains(lowerCaseSearchText));
          }
          return false;
        }).toList();
      }
      emit(VideoSummarySearchMatchesState());
    } else {
      if (searchText.isEmpty) {
        searchVideos = videoModelList.map((item) => item).toList();
      } else {
        String lowerCaseSearchText = searchText.toLowerCase();
        searchVideos = videoModelList.where((item) {
          if (item.matchDocModel.name != null &&
              favList.contains(item.matchDocModel.matchId.toString())) {
            List<String> teams =
                item.matchDocModel.name!.toLowerCase().split(" vs ");
            return teams.any((team) => team.contains(lowerCaseSearchText));
          }
          return false;
        }).toList();
      }
      emit(VideoSummarySearchMatchesState());
    }
  }

  bool isChecked = false;
  void showFavoriteMatches() {
    isChecked = !isChecked;
    if (isChecked == true) {
      searchVideos = videoModelList
          .where((item) =>
              favList.contains((item.matchDocModel.matchId).toString()))
          .toList();
    } else {
      searchVideo(searchText: '');
    }
    emit(VideoSummaryFilterFavoriteMatchesState());
  }
}
