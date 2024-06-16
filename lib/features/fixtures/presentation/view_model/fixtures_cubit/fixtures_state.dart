part of 'fixtures_cubit.dart';

@immutable
sealed class FixturesState {}

final class FixturesInitial extends FixturesState {}

final class FixturesGetMatchesLoadingState extends FixturesState {}

final class FixturesGetMatchesSuccessState extends FixturesState {}

final class FixturesGetMatchesFailureState extends FixturesState {
  final String errMessage;

  FixturesGetMatchesFailureState({required this.errMessage});
}

final class FixturesGenerateDateLoadingState extends FixturesState {}

final class FixturesGenerateDateFinishState extends FixturesState {}
