part of 'video_summary_cubit.dart';

@immutable
sealed class VideoSummaryState {}

final class VideoSummaryInitial extends VideoSummaryState {}

final class VideoSummaryGetDocLoadingState extends VideoSummaryState {}

final class VideoSummaryGetDocSuccessState extends VideoSummaryState {}

final class VideoSummaryGetDocFailureState extends VideoSummaryState {
  final String errMessage;

  VideoSummaryGetDocFailureState({required this.errMessage});
}

final class VideoSummaryGetAllMatchesLoadingState extends VideoSummaryState {}

final class VideoSummaryGetAllMatchesSuccessState extends VideoSummaryState {}

final class VideoSummaryGetAllMatchesFailureState extends VideoSummaryState {
  final String errMessage;

  VideoSummaryGetAllMatchesFailureState({required this.errMessage});
}

final class VideoSummarySearchMatchesState extends VideoSummaryState {}

final class VideoSummaryGetFavoriteMatchesLoadingState
    extends VideoSummaryState {}

final class VideoSummaryGetFavoriteMatchesSuccessState
    extends VideoSummaryState {}

final class VideoSummaryGetFavoriteMatchesFailureState
    extends VideoSummaryState {
  final String errMessage;

  VideoSummaryGetFavoriteMatchesFailureState({required this.errMessage});
}

final class VideoSummaryFilterFavoriteMatchesState extends VideoSummaryState {}
