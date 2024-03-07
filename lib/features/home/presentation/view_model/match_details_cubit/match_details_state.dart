part of 'match_details_cubit.dart';

@immutable
sealed class MatchDetailsState {}

final class MatchDetailsInitial extends MatchDetailsState {}

final class MatchDetailsGetMatchStatsLoadingState extends MatchDetailsState {}

final class MatchDetailsGetMatchStatsSuccessState extends MatchDetailsState {}

final class MatchDetailsGetMatchStatsFailureState extends MatchDetailsState {
  final String errMessage;

  MatchDetailsGetMatchStatsFailureState({required this.errMessage});
}
