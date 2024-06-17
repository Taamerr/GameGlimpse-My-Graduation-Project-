part of 'standings_cubit.dart';

@immutable
sealed class StandingsState {}

final class StandingsInitial extends StandingsState {}


final class StandingsGetLeaguesStandingLoadingState extends StandingsState {}

final class HStandingsGetLeaguesStandingSuccessState extends StandingsState {}

final class StandingsGetLeaguesStandingFailureState extends StandingsState {
  final String errMessage;

  StandingsGetLeaguesStandingFailureState({required this.errMessage});
}

final class StandingsGetAllLeaguesStandingLoadingState extends StandingsState {}

final class StandingsGetAllLeaguesStandingSuccessState extends StandingsState {}
