part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfilePickImageLoadingState extends EditProfileInitial {}

final class EditProfilePickImageSuccessState extends EditProfileInitial {}

final class EditProfilePickImageFailureState extends EditProfileInitial {
  final String errMessage;

  EditProfilePickImageFailureState({required this.errMessage});
}

final class EditProfileUploadImageLoadingState extends EditProfileInitial {}

final class EditProfileUploadImageSuccessState extends EditProfileInitial {}

final class EditProfileUploadImageFailureState extends EditProfileInitial {
  final String errMessage;

  EditProfileUploadImageFailureState({required this.errMessage});
}

final class EditProfileUpdateDataLoadingState extends EditProfileInitial {}

final class EditProfileUpdateDataSuccessState extends EditProfileInitial {}

final class EditProfileUpdateDataFailureState extends EditProfileInitial {
  final String errMessage;

  EditProfileUpdateDataFailureState({required this.errMessage});
}
