part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeBottomNavState extends HomeState {}

final class HomeGetLeaguesStandingLoadingState extends HomeState {}

final class HomeGetLeaguesStandingSuccessState extends HomeState {}

final class HomeGetLeaguesStandingFailureState extends HomeState {
  final String errMessage;

  HomeGetLeaguesStandingFailureState({required this.errMessage});
}

final class HomeGetAllLeaguesStandingLoadingState extends HomeState {}

final class HomeGetAllLeaguesStandingSuccessState extends HomeState {}
