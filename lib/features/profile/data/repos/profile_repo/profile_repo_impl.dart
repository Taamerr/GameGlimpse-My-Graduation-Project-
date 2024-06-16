import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/cache_helper.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo{
  @override
  Future<Either<String, void>> signOut() async{
    try {
      await FirebaseAuth.instance.signOut();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      CacheHelper.removeData(key: 'uId');
      CacheHelper.removeData(key: 'inco');
      Constants.userModel = null;
      return right(null);
    } catch (e) {
      return left('Error when sign out: ${e.toString()}');
    }
  }

}