import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/cache_helper.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<String, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
        userCreate(
          name: name,
          email: user.email!,
          uId: user.uid,
        );
      }
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        return left('The email address is not valid.');
      } else {
        return left('Unknown FirebaseAuth Exception. please try again.');
      }
    } catch (e) {
      return left('oops an error occurred. please try again.');
    }
  }

  @override
  Future<Either<String, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user!.emailVerified) {
        getUserData(uId: user.uid);
        return right(userCredential);
      } else {
        return left('Email is not verified');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        return left('The email address is not valid.');
      } else if (e.code == 'invalid-credential') {
        return left(
          'No user found for that email. Or wrong password provided for that user.',
        );
      } else {
        return left('Unknown FirebaseAuth Exception. please try again.');
      }
    } catch (e) {
      return left('oops an error occurred. please try again.');
    }
  }

  @override
  Future<Either<String, void>> signInWithGoogle() async {
    // Trigger the authentication flow

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        DocumentSnapshot userDoc = await userRef.get();
        if (!userDoc.exists) {
          userCreate(
            name: user.displayName!,
            email: user.email!,
            uId: user.uid,
            image: user.photoURL!,
          );
        }
        getUserData(uId: user.uid);
      }
      return right(null);
    } catch (e) {
      return left('oops an error occurred. please try again.');
    }
  }

  @override
  Future<void> userCreate({
    required String name,
    required String email,
    required String uId,
    String image = Constants.defaultImage,
  }) async {
    try {
      UserModel user = UserModel(
        name: name,
        email: email,
        uId: uId,
        bio: 'Bio...',
        image: image,
        favVideos: List.empty(),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(user.toJson());
    } on Exception catch (e) {
      print('Error when create user: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> getUserData({required String uId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        Constants.userModel = UserModel.fromJson(json: value.data()!);
        CacheHelper.saveData(key: 'uId', value: uId);
      });
      return right(null);
    } catch (e) {
      print('Error when get user data : ${e.toString()}');
      return left('Error when get user data : ${e.toString()}');
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
