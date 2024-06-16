part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileCheckUserLoadingState extends ProfileState {}
final class ProfileCheckUserFinishState extends ProfileState {}

final class ProfileSignOutLoadingState extends ProfileState {}

final class ProfileSignOutSuccessState extends ProfileState {}

final class ProfileSignOutFailureState extends ProfileState {
  final String errMessage;

  ProfileSignOutFailureState({required this.errMessage});
}
