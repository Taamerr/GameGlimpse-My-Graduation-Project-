import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProfileRepo {
  Future<Either<String, File?>> getProfileImage({required ImagePicker picker});
  Future<Either<String, String>> uploadProfileImage(
      {required File profileImage});
  Future<Either<String, void>> updateUserData({
    required String image,
    required String name,
    required String bio,
    required String uId,
    required String email,
    required List<String> favVideos,
  });
}
