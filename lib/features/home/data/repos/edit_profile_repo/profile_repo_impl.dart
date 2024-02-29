import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gp_app/features/auth/data/models/user_model.dart';
import 'package:gp_app/features/home/data/repos/edit_profile_repo/edit_profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoImpl implements EditProfileRepo {
  @override
  Future<Either<String, File?>> getProfileImage(
      {required ImagePicker picker}) async {
    try {
      File? profileImage;
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        return right(profileImage);
      }
      return right(profileImage);
    } catch (e) {
      return left('Error when pick profile image : ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> uploadProfileImage(
      {required File profileImage}) async {
    try {
      var result = await FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(profileImage.path).pathSegments.last}')
          .putFile(profileImage);
      String downloadUrl = await result.ref.getDownloadURL();
      return right(downloadUrl);
    } catch (e) {
      return left('Error when upload profile image : ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> updateUserData({
    required String image,
    required String name,
    required String bio,
    required String uId,
    required String email,
  }) async {
    try {
      UserModel userModel = UserModel(
        name: name,
        email: email,
        uId: uId,
        bio: bio,
        image: image,
      );
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update(userModel.toJson());
      return right(null);
    } catch (e) {
      return left('Error when update user data : ${e.toString()}');
    }
  }
}
