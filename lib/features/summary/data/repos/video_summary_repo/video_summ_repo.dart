import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../models/match_doc_model/match_doc_model.dart';
import '../../models/video_match_data_model/video_match_data_model.dart';

abstract class VideoSummaryRepo {
  Future<Either<Failure, List<MatchDocModel>>> getAllMatchDocuments();

  Future<Either<Failure, VideoMatchDataModel>> getAllMatchVideoData({
    required String matchesId,
  });
}
