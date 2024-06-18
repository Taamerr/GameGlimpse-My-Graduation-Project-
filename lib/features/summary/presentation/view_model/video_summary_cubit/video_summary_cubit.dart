import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/match_doc_model/match_doc_model.dart';
import '../../../data/models/match_doc_model/video_model.dart';
import '../../../data/models/video_match_data_model/video_match_data_model.dart';
import '../../../data/repos/video_summary_repo/video_summ_repo.dart';

part 'video_summary_state.dart';

class VideoSummaryCubit extends Cubit<VideoSummaryState> {
  VideoSummaryCubit(this.videoSummaryRepo) : super(VideoSummaryInitial());
  static VideoSummaryCubit get(context) => BlocProvider.of(context);
  final VideoSummaryRepo videoSummaryRepo;

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
    searchVideos = videoModelList;
  }

  List<VideoModel> searchVideos = [];
  void searchVideo({required String searchText}) {
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
  }
}
