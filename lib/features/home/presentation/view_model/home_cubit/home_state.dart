part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeBottomNavState extends HomeState {}

final class HomeGetUserDataLoadingState extends HomeState {}

final class HomeGetUserDataSuccessState extends HomeState {}

final class HomeGetUserDataFailureState extends HomeState {
  final String errMessage;

  HomeGetUserDataFailureState({required this.errMessage});
}

final class HomeSignOutLoadingState extends HomeState {}

final class HomeSignOutSuccessState extends HomeState {}

final class HomeSignOutFailureState extends HomeState {
  final String errMessage;

  HomeSignOutFailureState({required this.errMessage});
}

final class HomeGetMatchesLoadingState extends HomeState {}

final class HomeGetMatchesSuccessState extends HomeState {}

final class HomeGetMatchesFailureState extends HomeState {
  final String errMessage;

  HomeGetMatchesFailureState({required this.errMessage});
}

final class HomeGetAllLeaguesMatchesLoadingState extends HomeState {}

final class HomeGetAllLeaguesMatchesSuccessState extends HomeState {}

final class HomeGetAllMatchesDataLoadingState extends HomeState {}

final class HomeGetAllMatchesDataSuccessState extends HomeState {}
