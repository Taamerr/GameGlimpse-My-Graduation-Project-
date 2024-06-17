part of 'picked_date_cubit.dart';

@immutable
sealed class PickedDateState {}

final class PickedDateInitial extends PickedDateState {}

final class FixturesGetPickedDateMatchesLoadingState extends PickedDateState {}

final class FixturesGetPickedDateMatchesSuccessState extends PickedDateState {}

final class FixturesGetPickedDateMatchesFailureState extends PickedDateState {
  final String errMessage;

  FixturesGetPickedDateMatchesFailureState({required this.errMessage});
}
