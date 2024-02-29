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

final class HomePickImageLoadingState extends HomeState {}

final class HomePickImageSuccessState extends HomeState {}

final class HomePickImageFailureState extends HomeState {
  final String errMessage;

  HomePickImageFailureState({required this.errMessage});
}

final class HomeUploadImageLoadingState extends HomeState {}

final class HomeUploadImageSuccessState extends HomeState {}

final class HomeUploadImageFailureState extends HomeState {
  final String errMessage;

  HomeUploadImageFailureState({required this.errMessage});
}
