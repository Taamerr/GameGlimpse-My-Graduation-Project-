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
