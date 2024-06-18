// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gp_app/features/summary/data/models/match_doc_model/match_doc_model.dart';
import 'package:gp_app/features/summary/data/models/video_match_data_model/video_match_data.dart';

class VideoModel {
  MatchDocModel matchDocModel;
  VideoMatchData videoMatchData;
  VideoModel({
    required this.matchDocModel,
    required this.videoMatchData,
  });
}
