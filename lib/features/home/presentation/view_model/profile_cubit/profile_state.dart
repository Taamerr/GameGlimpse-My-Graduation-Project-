part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileCheckUserLoadingState extends ProfileState {}
final class ProfileCheckUserFinishState extends ProfileState {}
