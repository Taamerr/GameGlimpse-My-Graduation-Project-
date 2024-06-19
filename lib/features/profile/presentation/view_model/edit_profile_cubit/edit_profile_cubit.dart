import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../data/repos/edit_profile_repo/edit_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  static EditProfileCubit get(context) => BlocProvider.of(context);
  final EditProfileRepo profileRepo;

  File? profileImage;
  ImagePicker picker = ImagePicker();
  Future<void> getProfileImage() async {
    emit(EditProfilePickImageLoadingState());
    var result = await profileRepo.getProfileImage(picker: picker);
    result.fold(
      (failure) {
        emit(EditProfilePickImageFailureState(errMessage: failure));
      },
      (file) {
        profileImage = file;
        if (profileImage != null) {
          uploadProfileImage(profileImage: profileImage!);
          emit(EditProfilePickImageSuccessState());
        } else {
          EditProfilePickImageFailureState(
              errMessage: 'Profile image equal null');
        }
      },
    );
  }

  String? imageUrl;
  Future<void> uploadProfileImage({required File profileImage}) async {
    emit(EditProfileUploadImageLoadingState());
    var result =
        await profileRepo.uploadProfileImage(profileImage: profileImage);
    result.fold((failure) {
      emit(EditProfileUploadImageFailureState(errMessage: failure));
    }, (downloadUrl) {
      imageUrl = downloadUrl;
      emit(EditProfileUploadImageSuccessState());
    });
  }

  Future<void> updateUserData({
    required String image,
    required String name,
    required String bio,
    required String uId,
    required String email,
    required List<String> favVideos,
  }) async {
    emit(EditProfileUpdateDataLoadingState());
    var result = await profileRepo.updateUserData(
      bio: bio,
      email: email,
      image: image,
      name: name,
      uId: uId,
      favVideos: favVideos,
    );
    result.fold((failure) {
      emit(EditProfileUpdateDataFailureState(errMessage: failure));
    }, (_) {
      Constants.userModel = UserModel(
        name: name,
        email: email,
        uId: uId,
        bio: bio,
        image: image,
        favVideos: favVideos,
      );
      emit(EditProfileUpdateDataSuccessState());
    });
  }
}
